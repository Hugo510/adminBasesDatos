import psycopg2
import logging
import os
from pathlib import Path
from typing import Dict, Any, Optional, Tuple
from psycopg2 import pool
import time
from dotenv import load_dotenv
from typing import NoReturn

# Cargar variables de entorno
load_dotenv()

# Configuración de logging
logging.basicConfig(
    filename='database_insert.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def get_connection_params() -> Dict[str, Any]:
    """
    Devuelve los parámetros de conexión a la base de datos PostgreSQL desde variables de entorno.
    
    Returns:
        Dict[str, Any]: Diccionario con los parámetros de conexión.
        
    Raises:
        ValueError: Si faltan variables de entorno requeridas.
    """
    required_env_vars = ['DB_NAME', 'DB_USER', 'DB_PASSWORD', 'DB_HOST', 'DB_PORT']
    
    # Verificar que existan todas las variables requeridas
    missing_vars = [var for var in required_env_vars if not os.getenv(var)]
    if missing_vars:
        error_msg = f"Faltan las siguientes variables de entorno: {', '.join(missing_vars)}"
        logging.error(error_msg)
        raise ValueError(error_msg)

    return {
        "dbname": os.getenv('DB_NAME'),
        "user": os.getenv('DB_USER'),
        "password": os.getenv('DB_PASSWORD'),
        "host": os.getenv('DB_HOST'),
        "port": int(os.getenv('DB_PORT', 5432)),
        "client_encoding": os.getenv('DB_ENCODING', 'latin1')
    }

def get_files_and_tables() -> Dict[str, str]:
    """
    Devuelve un diccionario que mapea archivos CSV a tablas de la base de datos.
    
    Returns:
        Dict[str, str]: Mapeo de archivos a tablas.
    """
    return {
        "Materiales.csv": "Materiales",
        "Productos.csv": "Productos",
        "Flujos.csv": "Flujos",
        "Niveles.csv": "Niveles",
        "Maquinas.csv": "Maquinas",
        "Licencias.csv": "Licencias",
        "Empleados.csv": "Empleados",
        "Operadores_Licencias.csv": "Operadores_Licencias",
        "Producciones.csv": "Producciones",
        "Metas.csv": "Metas",
        "Producciones_Detalles.csv": "Producciones_Detalles",
        "Materiales_Productos.csv": "Materiales_Productos"
    }

def load_csv_to_db(conn, file_path: Path, table: str) -> None:
    """
    Carga un archivo CSV en una tabla de la base de datos.
    
    Args:
        conn: Objeto de conexión a la base de datos.
        file_path (Path): Ruta al archivo CSV.
        table (str): Nombre de la tabla en la base de datos.
    """
    logging.info(f"Cargando datos de {file_path} en la tabla {table}...")
    try:
        with file_path.open("r", encoding="latin1") as f:
            cur = conn.cursor()
            # Modificamos el comando COPY para especificar la codificación
            cur.copy_expert(
                f"COPY {table} FROM STDIN WITH (FORMAT CSV, ENCODING 'latin1', HEADER true)",
                f
            )
            conn.commit()
            cur.close()
        logging.info(f"Datos cargados correctamente en {table}.")
    except FileNotFoundError:
        logging.error(f"El archivo {file_path} no existe.")
    except psycopg2.Error as db_err:
        logging.error(f"Error al cargar datos en {table}: {db_err}")
        conn.rollback()
    except UnicodeDecodeError as decode_err:
        logging.error(f"Error de decodificación en {file_path}: {decode_err}")
        conn.rollback()

def test_connection(conn_params: Dict[str, Any]) -> Tuple[bool, str]:
    """
    Prueba la conexión a la base de datos.
    
    Args:
        conn_params: Parámetros de conexión
    
    Returns:
        Tuple[bool, str]: (éxito, mensaje)
    """
    try:
        conn = psycopg2.connect(**conn_params)
        with conn.cursor() as cursor:
            cursor.execute('SELECT version();')
            version = cursor.fetchone()[0]
            conn.close()
            return True, f"Conexión exitosa. Versión: {version}"
    except psycopg2.OperationalError as e:
        return False, f"Error de conexión: {e}"
    except Exception as e:
        return False, f"Error inesperado: {e}"

def initialize_connection_pool(minconn: int = 1, maxconn: int = 10, max_retries: int = 3) -> Optional[pool.SimpleConnectionPool]:
    """
    Inicializa un pool de conexiones a la base de datos con reintentos.
    
    Args:
        minconn: Número mínimo de conexiones
        maxconn: Número máximo de conexiones
        max_retries: Número máximo de intentos de conexión
    
    Returns:
        Optional[pool.SimpleConnectionPool]: Pool de conexiones o None en caso de error
    """
    conn_params = get_connection_params()
    retry_count = 0
    
    while retry_count < max_retries:
        try:
            # Primero probamos la conexión
            success, message = test_connection(conn_params)
            if not success:
                raise psycopg2.OperationalError(message)
                
            connection_pool = psycopg2.pool.SimpleConnectionPool(
                minconn,
                maxconn,
                **conn_params
            )
            
            # Verificamos que el pool funcione intentando obtener una conexión
            test_conn = connection_pool.getconn()
            connection_pool.putconn(test_conn)
            
            logging.info("Pool de conexiones creado exitosamente.")
            return connection_pool
            
        except psycopg2.OperationalError as e:
            retry_count += 1
            wait_time = 2 ** retry_count  # Espera exponencial
            logging.warning(f"Intento {retry_count} de {max_retries} falló. Error: {e}")
            logging.info(f"Esperando {wait_time} segundos antes del siguiente intento...")
            time.sleep(wait_time)
            
        except Exception as e:
            logging.error(f"Error crítico al crear el pool de conexiones: {e}")
            return None
            
    logging.error(f"No se pudo establecer la conexión después de {max_retries} intentos.")
    return None

def main() -> None:
    """
    Función principal que gestiona la conexión a la base de datos y la carga de datos desde CSV.
    """
    connection_pool = initialize_connection_pool()
    if not connection_pool:
        logging.error("No se pudo establecer el pool de conexiones. Terminando el proceso.")
        return

    csv_path = Path("./data/")
    files_and_tables = get_files_and_tables()

    try:
        conn = connection_pool.getconn()
        if not conn:
            raise psycopg2.OperationalError("No se pudo obtener una conexión del pool")
            
        with conn:
            with conn.cursor() as cursor:
                for filename, table in files_and_tables.items():
                    file_path = csv_path / filename
                    load_csv_to_db(conn, file_path, table)
        connection_pool.putconn(conn)
        
    except psycopg2.OperationalError as e:
        logging.error(f"Error operacional en la base de datos: {e}")
    except psycopg2.Error as e:
        logging.error(f"Error durante la inserción de datos: {e}")
    except Exception as e:
        logging.error(f"Error inesperado: {e}")
    finally:
        if connection_pool:
            connection_pool.closeall()
            logging.info("Pool de conexiones cerrado.")

if __name__ == "__main__":
    main()
