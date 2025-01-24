import psycopg2
# import os  # Eliminado si no se usa en otra parte
import logging
from pathlib import Path
from typing import Dict

# Configuración de logging
logging.basicConfig(
    filename='database_insert.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def get_connection_params() -> Dict[str, any]:
    """
    Devuelve los parámetros de conexión a la base de datos PostgreSQL.
    
    Returns:
        Dict[str, any]: Diccionario con los parámetros de conexión.
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
            conn.cursor().copy_expert(f"COPY {table} FROM STDIN WITH CSV HEADER", f)
        logging.info(f"Datos cargados correctamente en {table}.")
    except FileNotFoundError:
        logging.error(f"El archivo {file_path} no existe.")
    except psycopg2.Error as db_err:
        logging.error(f"Error al cargar datos en {table}: {db_err}")

def main() -> None:
    """
    Función principal que gestiona la conexión a la base de datos y la carga de datos desde CSV.
    """
    conn_params = get_connection_params()
    csv_path = Path("./data/")
    files_and_tables = get_files_and_tables()
    
    try:
        # Establecer conexión usando gestor de contexto
        with psycopg2.connect(**conn_params) as conn:
            with conn.cursor() as cursor:
                for filename, table in files_and_tables.items():
                    file_path = csv_path / filename
                    load_csv_to_db(conn, file_path, table)
        # No es necesario conn.commit() cuando se usa el gestor de contexto
    except psycopg2.OperationalError as op_err:
        logging.error(f"Error de conexión a la base de datos: {op_err}")
    except Exception as e:
        logging.error(f"Error inesperado durante la carga: {e}")

if __name__ == "__main__":
    main()
