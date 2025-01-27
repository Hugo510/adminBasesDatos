import psycopg2
# import os  # Eliminado si no se usa en otra parte
import logging
from pathlib import Path
from typing import Dict, Any, Optional
from psycopg2 import pool

# Configuración de logging
logging.basicConfig(
    filename='database_insert.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def get_connection_params() -> Dict[str, Any]:
    """
    Devuelve los parámetros de conexión a la base de datos PostgreSQL.
    
    Returns:
        Dict[str, Any]: Diccionario con los parámetros de conexión.
    """
    return {
        "dbname": "tu_base_de_datos",
        "user": "tu_usuario",
        "password": "tu_contraseña",
        "host": "localhost",
        "port": 5432
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
        with file_path.open("r", encoding="utf-8") as f:
            # Salta la cabecera del CSV
            next(f)
            cur = conn.cursor()
            cur.copy_expert(f"COPY {table} FROM STDIN WITH CSV HEADER", f)
            cur.close()
        logging.info(f"Datos cargados correctamente en {table}.")
    except FileNotFoundError:
        logging.error(f"El archivo {file_path} no existe.")
    except psycopg2.Error as db_err:
        logging.error(f"Error al cargar datos en {table}: {db_err}")

def initialize_connection_pool(minconn: int = 1, maxconn: int = 10) -> Optional[pool.SimpleConnectionPool]:
    """
    Inicializa un pool de conexiones a la base de datos.
    
    Args:
        minconn (int): Número mínimo de conexiones en el pool.
        maxconn (int): Número máximo de conexiones en el pool.
    
    Returns:
        Optional[pool.SimpleConnectionPool]: Pool de conexiones o None en caso de error.
    """
    conn_params = get_connection_params()
    try:
        connection_pool = psycopg2.pool.SimpleConnectionPool(
            minconn,
            maxconn,
            **conn_params
        )
        if connection_pool:
            logging.info("Pool de conexiones creado exitosamente.")
            return connection_pool
    except psycopg2.Error as e:
        logging.error(f"Error al crear el pool de conexiones: {e}")
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
    record_counts = {}

    try:
        conn = connection_pool.getconn()
        if conn:
            with conn:
                with conn.cursor() as cursor:
                    for filename, table in files_and_tables.items():
                        file_path = csv_path / filename
                        load_csv_to_db(conn, file_path, table)
                        # Opcional: Contar registros insertados si es necesario
            connection_pool.putconn(conn)
    except psycopg2.Error as e:
        logging.error(f"Error durante la inserción de datos: {e}")
    finally:
        connection_pool.closeall()
        logging.info("Pool de conexiones cerrado.")

if __name__ == "__main__":
    main()
