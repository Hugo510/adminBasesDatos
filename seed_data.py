"""
Este script genera y almacena datos simulados en archivos CSV para diversas tablas de una base de datos.
Está diseñado para ser modular, escalable y fácil de mantener, siguiendo las buenas prácticas de programación.
"""

# Importando bibliotecas necesarias
import pandas as pd
import random
from datetime import datetime, timedelta
from pathlib import Path
import logging
from typing import Dict, Any, Optional

# Configuración de logging
logging.basicConfig(
    filename='seed_data.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

# Path para guardar los archivos CSV
path = Path("./data/")

# Crear el directorio si no existe
path.mkdir(parents=True, exist_ok=True)

# Helper function to generate random timestamps
def random_timestamp(start_year: int = 2020, end_year: int = 2025) -> str:
    """
    Genera una fecha y hora aleatoria entre start_year y end_year.
    
    :param start_year: Año de inicio para la generación de fechas.
    :param end_year: Año de fin para la generación de fechas.
    :return: Cadena con la fecha y hora en formato "%Y-%m-%d %H:%M:%S".
    """
    start_date = datetime(start_year, 1, 1)
    end_date = datetime(end_year, 1, 1)
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    random_date = start_date + timedelta(days=random_days)
    return random_date.strftime("%Y-%m-%d %H:%M:%S")

# Nueva función para crear DataFrames
def create_dataframe(data: Dict[str, Any], filename: str) -> Optional[pd.DataFrame]:
    """
    Crea un DataFrame a partir de un diccionario de datos y lo guarda como CSV.
    
    :param data: Diccionario con los datos.
    :param filename: Nombre del archivo CSV.
    :return: DataFrame creado o None en caso de error.
    """
    try:
        df = pd.DataFrame(data)
        df.to_csv(path / filename, index=False)
        logging.info(f"Archivo {filename} creado exitosamente.")
        return df
    except Exception as e:
        logging.error(f"Error al crear o guardar {filename}: {e}")
        return None

# Definir cantidades de registros por tabla (actualizado)
COUNTS = {
    "Materiales": 700,
    "Productos": 700,
    "Flujos": 10,
    "Niveles": 20,
    "Maquinas": 100,
    "Licencias": 700,
    "Empleados": 700,
    "Operadores_Licencias": 700,
    "Producciones": 700,
    "Metas": 700,
    "Producciones_Detalles": 700,
    "Materiales_Productos": 700,
    "Productos_Flujos": 700  # Registro agregado para la tabla Productos_Flujos
}

# Generando datasets para todas las tablas
def generate_materiales(count: int) -> Optional[pd.DataFrame]:
    materiales = {
        "id": range(1, count + 1),
        "nombre": [f"Material_{i:04}" for i in range(1, count + 1)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(materiales, "Materiales.csv")

def generate_productos(count: int) -> Optional[pd.DataFrame]:
    productos = {
        "id": range(1, count + 1),
        "nombre": [f"Producto_{i:04}" for i in range(1, count + 1)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(productos, "Productos.csv")

def generate_flujos(count: int) -> Optional[pd.DataFrame]:
    flujos = {
        "id": range(1, count + 1),
        "activo": [random.choice([True, False]) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(flujos, "Flujos.csv")

def generate_niveles(count: int) -> Optional[pd.DataFrame]:
    niveles = {
        "id": range(1, count + 1),
        "nombre": [f"Nivel_{i:03}" for i in range(1, count + 1)],
        "descripcion": [f"Descripción del Nivel {i}" for i in range(1, count + 1)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(niveles, "Niveles.csv")

def generate_maquinas(count: int) -> Optional[pd.DataFrame]:
    maquinas = {
        "no_serie": [f"MAQ_{i:04}" for i in range(1, count + 1)],
        "tipo": [f"Tipo_{random.randint(1, 20)}" for _ in range(count)],
        "fk_flujo": [random.randint(1, COUNTS["Flujos"]) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(maquinas, "Maquinas.csv")

def generate_licencias(count: int, maquinas_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    licencias = {
        "id": range(1, count + 1),
        "nombre": [f"Licencia_{i:04}" for i in range(1, count + 1)],
        "fk_maquina": [random.choice(maquinas_df["no_serie"]) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(licencias, "Licencias.csv")

def generate_empleados(count: int, niveles_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    empleados = {
        "id": range(1, count + 1),
        "nombre": [f"Empleado_{i:04}" for i in range(1, count + 1)],
        "fk_nivel": [random.randint(1, COUNTS["Niveles"]) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(empleados, "Empleados.csv")

def generate_operadores_licencias(count: int, empleados_df: pd.DataFrame, licencias_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    operadores_licencias = {
        "id": range(1, count + 1),
        "fk_empleado": [random.randint(1, COUNTS["Empleados"]) for _ in range(count)],
        "fk_licencia": [random.randint(1, COUNTS["Licencias"]) for _ in range(count)],
        "fecha_expiracion": [
            (datetime.strptime("2025-01-01", "%Y-%m-%d") - timedelta(days=random.randint(1, 365))).strftime("%Y-%m-%d")
            for _ in range(count)
        ],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(operadores_licencias, "Operadores_Licencias.csv")

def generate_producciones(count: int, flujos_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    producciones = {
        "id": range(1, count + 1),
        "cantidad_producto": [random.randint(100, 1000) for _ in range(count)],
        "fk_flujo": [random.randint(1, COUNTS["Flujos"]) for _ in range(count)],
        "fecha": [
            (datetime.strptime("2025-01-01", "%Y-%m-%d") - timedelta(days=random.randint(1, 365))).strftime("%Y-%m-%d")
            for _ in range(count)
        ],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(producciones, "Producciones.csv")

def generate_metas(count: int, productos_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    metas = {
        "id": range(1, count + 1),
        "unidades": [random.randint(500, 1500) for _ in range(count)],
        "fk_producto": [random.randint(1, COUNTS["Productos"]) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(metas, "Metas.csv")

def generate_producciones_detalles(count: int, producciones_df: pd.DataFrame, metas_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    producciones_detalles = {
        "id": range(1, count + 1),
        "fk_produccion": [random.randint(1, COUNTS["Producciones"]) for _ in range(count)],
        "fk_meta": [random.randint(1, COUNTS["Metas"]) for _ in range(count)],
        "cumplio": [random.choice([True, False]) for _ in range(count)],
        "tiempo_muerto": [random.randint(0, 60) for _ in range(count)],  # en minutos
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(producciones_detalles, "Producciones_Detalles.csv")

def generate_materiales_productos(count: int, materiales_df: pd.DataFrame, productos_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    materiales_productos = {
        "id": range(1, count + 1),
        "fk_material": [random.randint(1, COUNTS["Materiales"]) for _ in range(count)],
        "fk_producto": [random.randint(1, COUNTS["Productos"]) for _ in range(count)],
        "cantidad": [random.randint(1, 10) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(materiales_productos, "Materiales_Productos.csv")

def generate_productos_flujos(count: int, productos_df: pd.DataFrame, flujos_df: pd.DataFrame) -> Optional[pd.DataFrame]:
    """
    Genera datos simulados para la tabla Productos_Flujos y los guarda en un archivo CSV.
    
    :param count: Número de registros a generar.
    :param productos_df: DataFrame con los registros de la tabla Productos.
    :param flujos_df: DataFrame con los registros de la tabla Flujos.
    :return: DataFrame creado o None en caso de error.
    """
    productos_flujos = {
        "id": range(1, count + 1),
        "fk_producto": [random.choice(list(productos_df["id"])) for _ in range(count)],
        "fk_flujo": [random.choice(list(flujos_df["id"])) for _ in range(count)],
        "created_at": [random_timestamp() for _ in range(count)],
        "updated_at": [random_timestamp() for _ in range(count)],
    }
    return create_dataframe(productos_flujos, "Productos_Flujos.csv")


def main() -> None:
    """
    Función principal que gestiona la generación de datos y creación de archivos CSV.
    """
    logging.info("Inicio de la generación de datos.")
    record_counts = {}
    
    try:
        materiales_df = generate_materiales(COUNTS["Materiales"])
        record_counts["Materiales"] = len(materiales_df) if materiales_df is not None else 0
        
        productos_df = generate_productos(COUNTS["Productos"])
        record_counts["Productos"] = len(productos_df) if productos_df is not None else 0
        
        flujos_df = generate_flujos(COUNTS["Flujos"])
        record_counts["Flujos"] = len(flujos_df) if flujos_df is not None else 0
        
        niveles_df = generate_niveles(COUNTS["Niveles"])
        record_counts["Niveles"] = len(niveles_df) if niveles_df is not None else 0
        
        maquinas_df = generate_maquinas(COUNTS["Maquinas"])
        record_counts["Maquinas"] = len(maquinas_df) if maquinas_df is not None else 0
        
        licencias_df = generate_licencias(COUNTS["Licencias"], maquinas_df)
        record_counts["Licencias"] = len(licencias_df) if licencias_df is not None else 0
        
        empleados_df = generate_empleados(COUNTS["Empleados"], niveles_df)
        record_counts["Empleados"] = len(empleados_df) if empleados_df is not None else 0
        
        operadores_licencias_df = generate_operadores_licencias(COUNTS["Operadores_Licencias"], empleados_df, licencias_df)
        record_counts["Operadores_Licencias"] = len(operadores_licencias_df) if operadores_licencias_df is not None else 0
        
        producciones_df = generate_producciones(COUNTS["Producciones"], flujos_df)
        record_counts["Producciones"] = len(producciones_df) if producciones_df is not None else 0
        
        metas_df = generate_metas(COUNTS["Metas"], productos_df)
        record_counts["Metas"] = len(metas_df) if metas_df is not None else 0
        
        producciones_detalles_df = generate_producciones_detalles(COUNTS["Producciones_Detalles"], producciones_df, metas_df)
        record_counts["Producciones_Detalles"] = len(producciones_detalles_df) if producciones_detalles_df is not None else 0
        
        materiales_productos_df = generate_materiales_productos(COUNTS["Materiales_Productos"], materiales_df, productos_df)
        record_counts["Materiales_Productos"] = len(materiales_productos_df) if materiales_productos_df is not None else 0

        # Generar datos para la tabla Productos_Flujos
        productos_flujos_df = generate_productos_flujos(COUNTS["Productos_Flujos"], productos_df, flujos_df)
        record_counts["Productos_Flujos"] = len(productos_flujos_df) if productos_flujos_df is not None else 0
        
        logging.info("Generación de datos completada.")
    except Exception as e:
        logging.error(f"Error durante la generación de datos: {e}")
    
    logging.info(f"Cantidad de registros generados: {record_counts}")

if __name__ == "__main__":
    main()
