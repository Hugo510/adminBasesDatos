import csv
import logging
import os
from pathlib import Path
from pymongo import MongoClient
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

# Configuración del logging
logging.basicConfig(
    filename='mongodb_insert.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def get_mongodb_params() -> dict:
    """
    Obtiene los parámetros de conexión a MongoDB desde variables de entorno.
    Se deben definir las variables: MONGO_URI y MONGO_DB.
    
    Returns:
        dict: Diccionario con la URI y el nombre de la base de datos.
    
    Raises:
        ValueError: Si faltan variables de entorno requeridas.
    """
    required_vars = ['MONGO_URI', 'MONGO_DB']
    missing = [var for var in required_vars if not os.getenv(var)]
    if missing:
        error_msg = f"Faltan las siguientes variables de entorno: {', '.join(missing)}"
        logging.error(error_msg)
        raise ValueError(error_msg)
    
    return {
        "uri": os.getenv("MONGO_URI"),
        "db": os.getenv("MONGO_DB")
    }

def get_files_and_collections() -> dict:
    """
    Devuelve un diccionario que mapea archivos CSV a colecciones en MongoDB.
    
    Returns:
        dict: Mapeo de archivos CSV a colecciones.
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
        "Materiales_Productos.csv": "Materiales_Productos",
        "Productos_Flujos.csv": "Productos_Flujos"
    }

def load_csv_to_mongodb(mongo_client: MongoClient, file_path: Path, collection_name: str) -> None:
    """
    Carga un archivo CSV en una colección de MongoDB.
    
    Args:
        mongo_client (MongoClient): Cliente de conexión a MongoDB.
        file_path (Path): Ruta al archivo CSV.
        collection_name (str): Nombre de la colección donde se insertarán los datos.
    """
    logging.info(f"Cargando datos de {file_path} en la colección '{collection_name}'...")
    try:
        params = get_mongodb_params()
        db = mongo_client[params["db"]]
        collection = db[collection_name]

        # Abrir el archivo CSV y leerlo como diccionario
        with file_path.open("r", encoding="utf-8") as csvfile:
            reader = csv.DictReader(csvfile)
            documents = list(reader)
        
        if documents:
            collection.insert_many(documents)
            logging.info(f"Datos cargados correctamente en la colección '{collection_name}'.")
        else:
            logging.info(f"No se encontraron datos en {file_path} para cargar.")
    except FileNotFoundError:
        logging.error(f"El archivo {file_path} no existe.")
    except Exception as e:
        logging.error(f"Error al cargar datos en la colección '{collection_name}': {e}")

def main_mongodb() -> None:
    """
    Función principal para conectarse a MongoDB y cargar datos desde archivos CSV en las colecciones correspondientes.
    """
    try:
        params = get_mongodb_params()
        # Crear el cliente de MongoDB
        mongo_client = MongoClient(params["uri"])
        
        # Definir el directorio donde se encuentran los archivos CSV
        csv_path = Path("./data/")
        files_and_collections = get_files_and_collections()
        
        # Iterar sobre cada archivo y cargarlo en la colección correspondiente
        for filename, collection_name in files_and_collections.items():
            file_path = csv_path / filename
            load_csv_to_mongodb(mongo_client, file_path, collection_name)
        
        mongo_client.close()
        logging.info("Conexión a MongoDB cerrada.")
    except Exception as e:
        logging.error(f"Error en la función principal de MongoDB: {e}")

if __name__ == "__main__":
    main_mongodb()
