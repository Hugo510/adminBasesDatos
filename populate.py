"""
Este script genera y almacena datos simulados en archivos CSV para diversas tablas de una base de datos.
Está diseñado para ser modular, escalable y fácil de mantener, siguiendo las buenas prácticas de programación.
"""

# Importando bibliotecas necesarias
import pandas as pd
import random
from datetime import datetime, timedelta
import os

# Path para guardar los archivos CSV
path = "./data/"

# Crear el directorio si no existe
if not os.path.exists(path):
    os.makedirs(path)

# Helper function to generate random timestamps
def random_timestamp(start_year=2020, end_year=2025):
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
def create_dataframe(data, filename):
    """
    Crea un DataFrame a partir de un diccionario de datos y lo guarda como CSV.
    
    :param data: Diccionario con los datos.
    :param filename: Nombre del archivo CSV.
    :return: DataFrame creado o None en caso de error.
    """
    try:
        df = pd.DataFrame(data)
        df.to_csv(os.path.join(path, filename), index=False)
        return df
    except Exception as e:
        print(f"Error al crear o guardar {filename}: {e}")
        return None

# Definir cantidades de registros por tabla
MATERIALES_COUNT = 700
PRODUCTOS_COUNT = 700
FLUJOS_COUNT = 10  # Aumentado para soportar más relaciones
NIVELES_COUNT = 20
MAQUINAS_COUNT = 100
LICENCIAS_COUNT = 700
EMPLEADOS_COUNT = 700
OPERADORES_LICENCIAS_COUNT = 700
PRODUCCIONES_COUNT = 700
METAS_COUNT = 700
PRODUCCIONES_DETALLES_COUNT = 700
MATERIALES_PRODUCTOS_COUNT = 700

# Generando datasets para todas las tablas

# 1. Materiales
materiales = {
    "id": range(1, MATERIALES_COUNT + 1),
    "nombre": [f"Material_{i:04}" for i in range(1, MATERIALES_COUNT + 1)],
    "created_at": [random_timestamp() for _ in range(MATERIALES_COUNT)],
    "updated_at": [random_timestamp() for _ in range(MATERIALES_COUNT)],
}
materiales_df = create_dataframe(materiales, "Materiales.csv")

# 2. Productos
productos = {
    "id": range(1, PRODUCTOS_COUNT + 1),
    "nombre": [f"Producto_{i:04}" for i in range(1, PRODUCTOS_COUNT + 1)],
    "created_at": [random_timestamp() for _ in range(PRODUCTOS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(PRODUCTOS_COUNT)],
}
productos_df = create_dataframe(productos, "Productos.csv")

# 3. Flujos
flujos = {
    "id": range(1, FLUJOS_COUNT + 1),
    "activo": [random.randint(0, 1) for _ in range(FLUJOS_COUNT)],
    "created_at": [random_timestamp() for _ in range(FLUJOS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(FLUJOS_COUNT)],
}
flujos_df = create_dataframe(flujos, "Flujos.csv")

# 4. Niveles
niveles = {
    "id": range(1, NIVELES_COUNT + 1),
    "nombre": [f"Nivel_{i:03}" for i in range(1, NIVELES_COUNT + 1)],
    "descripcion": [f"Descripción del Nivel {i}" for i in range(1, NIVELES_COUNT + 1)],
    "created_at": [random_timestamp() for _ in range(NIVELES_COUNT)],
    "updated_at": [random_timestamp() for _ in range(NIVELES_COUNT)],
}
niveles_df = create_dataframe(niveles, "Niveles.csv")

# 5. Maquinas (generar 100 registros únicos)
maquinas = {
    "no_serie": [f"MAQ_{i:04}" for i in range(1, MAQUINAS_COUNT + 1)],
    "tipo": [f"Tipo_{random.randint(1, 20)}" for _ in range(MAQUINAS_COUNT)],
    "fk_flujo": [random.randint(1, FLUJOS_COUNT) for _ in range(MAQUINAS_COUNT)],
    "created_at": [random_timestamp() for _ in range(MAQUINAS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(MAQUINAS_COUNT)],
}
maquinas_df = create_dataframe(maquinas, "Maquinas.csv")

# 6. Licencias (generar 700 licencias)
licencias = {
    "id": range(1, LICENCIAS_COUNT + 1),
    "nombre": [f"Licencia_{i:04}" for i in range(1, LICENCIAS_COUNT + 1)],
    "fk_maquina": [random.choice(maquinas_df["no_serie"]) for _ in range(LICENCIAS_COUNT)],
    "created_at": [random_timestamp() for _ in range(LICENCIAS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(LICENCIAS_COUNT)],
}
licencias_df = create_dataframe(licencias, "Licencias.csv")

# 7. Empleados (generar 700 empleados)
empleados = {
    "id": range(1, EMPLEADOS_COUNT + 1),
    "nombre": [f"Empleado_{i:04}" for i in range(1, EMPLEADOS_COUNT + 1)],
    "fk_nivel": [random.randint(1, NIVELES_COUNT) for _ in range(EMPLEADOS_COUNT)],
    "created_at": [random_timestamp() for _ in range(EMPLEADOS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(EMPLEADOS_COUNT)],
}
empleados_df = create_dataframe(empleados, "Empleados.csv")

# 8. Operadores_Licencias (generar 700 registros)
operadores_licencias = {
    "id": range(1, OPERADORES_LICENCIAS_COUNT + 1),
    "fk_empleado": [random.randint(1, EMPLEADOS_COUNT) for _ in range(OPERADORES_LICENCIAS_COUNT)],
    "fk_licencia": [random.randint(1, LICENCIAS_COUNT) for _ in range(OPERADORES_LICENCIAS_COUNT)],
    "fecha_expiracion": [
        (datetime.strptime("2025-01-01", "%Y-%m-%d") - timedelta(days=random.randint(1, 365))).strftime("%Y-%m-%d")
        for _ in range(OPERADORES_LICENCIAS_COUNT)
    ],
    "created_at": [random_timestamp() for _ in range(OPERADORES_LICENCIAS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(OPERADORES_LICENCIAS_COUNT)],
}
operadores_licencias_df = create_dataframe(operadores_licencias, "Operadores_Licencias.csv")

# 9. Producciones (generar 700 registros)
producciones = {
    "id": range(1, PRODUCCIONES_COUNT + 1),
    "cantidad_producto": [random.randint(100, 1000) for _ in range(PRODUCCIONES_COUNT)],
    "fk_flujo": [random.randint(1, FLUJOS_COUNT) for _ in range(PRODUCCIONES_COUNT)],
    "fecha": [
        (datetime.strptime("2025-01-01", "%Y-%m-%d") - timedelta(days=random.randint(1, 365))).strftime("%Y-%m-%d")
        for _ in range(PRODUCCIONES_COUNT)
    ],
    "created_at": [random_timestamp() for _ in range(PRODUCCIONES_COUNT)],
    "updated_at": [random_timestamp() for _ in range(PRODUCCIONES_COUNT)],
}
producciones_df = create_dataframe(producciones, "Producciones.csv")

# 10. Metas (generar 700 registros)
metas = {
    "id": range(1, METAS_COUNT + 1),
    "unidades": [random.randint(500, 1500) for _ in range(METAS_COUNT)],
    "fk_producto": [random.randint(1, PRODUCTOS_COUNT) for _ in range(METAS_COUNT)],
    "created_at": [random_timestamp() for _ in range(METAS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(METAS_COUNT)],
}
metas_df = create_dataframe(metas, "Metas.csv")

# 11. Producciones_Detalles (generar 700 registros)
producciones_detalles = {
    "id": range(1, PRODUCCIONES_DETALLES_COUNT + 1),
    "fk_produccion": [random.randint(1, PRODUCCIONES_COUNT) for _ in range(PRODUCCIONES_DETALLES_COUNT)],
    "fk_meta": [random.randint(1, METAS_COUNT) for _ in range(PRODUCCIONES_DETALLES_COUNT)],
    "cumplio": [random.randint(0, 1) for _ in range(PRODUCCIONES_DETALLES_COUNT)],
    "tiempo_muerto": [random.randint(0, 60) for _ in range(PRODUCCIONES_DETALLES_COUNT)],  # en minutos
    "created_at": [random_timestamp() for _ in range(PRODUCCIONES_DETALLES_COUNT)],
    "updated_at": [random_timestamp() for _ in range(PRODUCCIONES_DETALLES_COUNT)],
}
producciones_detalles_df = create_dataframe(producciones_detalles, "Producciones_Detalles.csv")

# 12. Materiales_Productos (generar 700 registros)
materiales_productos = {
    "id": range(1, MATERIALES_PRODUCTOS_COUNT + 1),
    "fk_material": [random.randint(1, MATERIALES_COUNT) for _ in range(MATERIALES_PRODUCTOS_COUNT)],
    "fk_producto": [random.randint(1, PRODUCTOS_COUNT) for _ in range(MATERIALES_PRODUCTOS_COUNT)],
    "cantidad": [random.randint(1, 10) for _ in range(MATERIALES_PRODUCTOS_COUNT)],
    "created_at": [random_timestamp() for _ in range(MATERIALES_PRODUCTOS_COUNT)],
    "updated_at": [random_timestamp() for _ in range(MATERIALES_PRODUCTOS_COUNT)],
}
materiales_productos_df = create_dataframe(materiales_productos, "Materiales_Productos.csv")

# Verificar la cantidad de registros para todas las tablas
record_counts = {
    "Materiales": len(materiales_df),
    "Productos": len(productos_df),
    "Flujos": len(flujos_df),
    "Niveles": len(niveles_df),
    "Maquinas": len(maquinas_df),
    "Licencias": len(licencias_df),
    "Empleados": len(empleados_df),
    "Operadores_Licencias": len(operadores_licencias_df),
    "Producciones": len(producciones_df),
    "Metas": len(metas_df),
    "Producciones_Detalles": len(producciones_detalles_df),
    "Materiales_Productos": len(materiales_productos_df),
}
record_counts
