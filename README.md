> [!NOTE]
> Esto es para una clase de la carrera, sin ánimos de lucro.

# Generador de Datos Simulados para Base de Datos

## Descripción

Este proyecto consiste en un script Python (`populate.py`) diseñado para generar y almacenar datos simulados en archivos CSV para diversas tablas de una base de datos. El objetivo principal es facilitar la creación de conjuntos de datos extensos y coherentes, asegurando la integridad referencial y permitiendo una fácil escalabilidad y mantenimiento.

## Características

- **Generación Automatizada de Datos**: Crea grandes volúmenes de datos simulados para múltiples tablas.
- **Configuración Flexible**: Permite ajustar fácilmente la cantidad de registros por tabla.
- **Manejo de Errores**: Implementa bloques `try-except` para gestionar posibles excepciones durante la creación y almacenamiento de datos.
- **Modularidad y Escalabilidad**: Estructura el código de manera modular para facilitar futuras expansiones y mantenimientos.
- **Documentación Completa**: Incluye docstrings y comentarios descriptivos para mejorar la legibilidad y mantenibilidad del código.

## Instalación

### Requisitos

- **Python**: Versión 3.6 o superior.
- **Bibliotecas Python**:
  - `pandas`
  - `random`
  - `datetime`
  - `os`

### Pasos de Instalación

1. **Clonar el Repositorio**

   ```bash
   git clone https://github.com/tu_usuario/tu_repositorio.git
   ```

2. **Navegar al Directorio del Proyecto**

   ```bash
   cd tu_repositorio
   ```

3. **Crear un Entorno Virtual (Opcional pero Recomendado)**

   ```bash
   python -m venv env
   ```

4. **Activar el Entorno Virtual**

   - **En Windows**

     ```bash
     env\Scripts\activate
     ```

   - **En macOS/Linux**

     ```bash
     source env/bin/activate
     ```

5. **Instalar las Dependencias**

   ```bash
   pip install pandas
   ```

## Uso

Ejecuta el script `populate.py` para generar los archivos CSV con datos simulados.

```bash
python populate.py
```

Los archivos CSV se guardarán en el directorio `./data/`. Si el directorio no existe, el script lo creará automáticamente.

## Estructura del Proyecto

```
tu_repositorio/
├── data/
│   ├── Materiales.csv
│   ├── Productos.csv
│   ├── Flujos.csv
│   ├── Niveles.csv
│   ├── Maquinas.csv
│   ├── Licencias.csv
│   ├── Empleados.csv
│   ├── Operadores_Licencias.csv
│   ├── Producciones.csv
│   ├── Metas.csv
│   ├── Producciones_Detalles.csv
│   └── Materiales_Productos.csv
├── populate.py
├── load_data_mongodb.py
└── README.md
```

## Detalles de Generación de Datos

El script `populate.py` genera datos simulados para las siguientes tablas:

1. **Materiales**

   - **Descripción**: Tabla de materiales utilizados.
   - **Campos**: `id`, `nombre`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

2. **Productos**

   - **Descripción**: Tabla de productos disponibles.
   - **Campos**: `id`, `nombre`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

3. **Flujos**

   - **Descripción**: Tabla de flujos de trabajo.
   - **Campos**: `id`, `activo`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 10

4. **Niveles**

   - **Descripción**: Tabla de niveles de acceso.
   - **Campos**: `id`, `nombre`, `descripcion`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 20

5. **Maquinas**

   - **Descripción**: Tabla de máquinas utilizadas.
   - **Campos**: `no_serie`, `tipo`, `fk_flujo`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 100

6. **Licencias**

   - **Descripción**: Tabla de licencias de máquinas.
   - **Campos**: `id`, `nombre`, `fk_maquina`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

7. **Empleados**

   - **Descripción**: Tabla de empleados de la empresa.
   - **Campos**: `id`, `nombre`, `fk_nivel`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

8. **Operadores_Licencias**

   - **Descripción**: Tabla de licencias asignadas a empleados.
   - **Campos**: `id`, `fk_empleado`, `fk_licencia`, `fecha_expiracion`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

9. **Producciones**

   - **Descripción**: Tabla de registros de producción.
   - **Campos**: `id`, `cantidad_producto`, `fk_flujo`, `fecha`, `created_at`, `updated_at`.
   - **Cantidad de Registros**: 700

10. **Metas**

    - **Descripción**: Tabla de metas de producción.
    - **Campos**: `id`, `unidades`, `fk_producto`, `created_at`, `updated_at`.
    - **Cantidad de Registros**: 700

11. **Producciones_Detalles**

    - **Descripción**: Tabla de detalles de producción.
    - **Campos**: `id`, `fk_produccion`, `fk_meta`, `cumplio`, `tiempo_muerto`, `created_at`, `updated_at`.
    - **Cantidad de Registros**: 700

12. **Materiales_Productos**
    - **Descripción**: Tabla de relación entre materiales y productos.
    - **Campos**: `id`, `fk_material`, `fk_producto`, `cantidad`, `created_at`, `updated_at`.
    - **Cantidad de Registros**: 700

## Mejoras Implementadas en `insert.py`

### Estructura Modular

El script `insert.py` ha sido refactorizado para mejorar la legibilidad y la mantenibilidad del código mediante la encapsulación de la lógica principal en funciones reutilizables:

- `get_connection_params()`: Obtiene los parámetros de conexión a la base de datos.
- `get_files_and_tables()`: Mapea los archivos CSV a sus correspondientes tablas en la base de datos.
- `load_csv_to_db(conn, file_path, table)`: Gestiona la carga de un archivo CSV específico en una tabla de la base de datos.
- `initialize_connection_pool()`: Inicializa un pool de conexiones para manejar eficientemente múltiples conexiones.
- `main()`: Función principal que orquesta la conexión a la base de datos y la carga de los datos.

### Anotaciones de Tipo

Se han añadido anotaciones de tipo para mejorar la claridad del código y facilitar el mantenimiento:

```python
def get_connection_params() -> Dict[str, Any]:
def get_files_and_tables() -> Dict[str, str]:
def load_csv_to_db(conn, file_path: Path, table: str) -> None:
def initialize_connection_pool(minconn: int = 1, maxconn: int = 10) -> Optional[pool.SimpleConnectionPool]:
def main() -> None:
```

### Validación de Archivos CSV

Antes de intentar cargar los datos, el script verifica la existencia de cada archivo CSV, lo que previene errores en tiempo de ejecución si algún archivo está ausente.

### Manejo de Excepciones Específicas

El manejo de excepciones se ha mejorado para capturar y gestionar errores más detallados:

- `FileNotFoundError`: Capturado cuando un archivo CSV no existe.
- `psycopg2.Error`: Captura errores específicos relacionados con la base de datos.
- `psycopg2.OperationalError`: Maneja errores de conexión a la base de datos.
- Excepciones generales: Captura cualquier otro tipo de error inesperado.

### Uso de `pathlib`

Se ha adoptado la biblioteca `pathlib` para una gestión más eficiente y moderna de las rutas de archivo, reemplazando el uso de `os.path`:

```python
from pathlib import Path
```

### Configuración Avanzada de Logging

El sistema de logging ha sido mejorado para registrar eventos en un archivo de log (`database_insert.log`), ofreciendo un seguimiento más detallado de las operaciones y facilitando la depuración:

```python
logging.basicConfig(
    filename='database_insert.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
```

### Pool de Conexiones

Se ha implementado un pool de conexiones utilizando `psycopg2.pool.SimpleConnectionPool` para manejar múltiples conexiones de manera eficiente y reducir la sobrecarga de establecer conexiones repetidamente.

### Manejo de Recursos

Se asegura el cierre adecuado de recursos mediante el uso de gestores de contexto (`with`), lo que previene fugas de recursos y garantiza que las conexiones y archivos se cierren correctamente incluso en caso de errores.

### Beneficios de las Mejoras

- **Legibilidad y Mantenibilidad**: La estructura modular y las anotaciones de tipo hacen que el código sea más fácil de entender y mantener.
- **Robustez**: La validación de archivos y el manejo de excepciones específicas aumentan la confiabilidad del script.
- **Eficiencia**: El uso de `pathlib` y un pool de conexiones simplifica la gestión de rutas y mejora el rendimiento al manejar conexiones.
- **Trazabilidad**: El logging detallado permite un seguimiento efectivo de las operaciones y facilita la identificación y resolución de problemas.
- **Escalabilidad**: La modularidad y el manejo eficiente de conexiones permiten que el sistema escale fácilmente para manejar mayores volúmenes de datos.

## Mejoras Implementadas en `load_data_mongodb.py`

### Carga de Datos en MongoDB

El script `load_data_mongodb.py` ha sido desarrollado para cargar los datos generados en archivos CSV a una base de datos MongoDB, ofreciendo una alternativa NoSQL al almacenamiento relacional.

### Características Principales

- **Conexión a MongoDB**: Establece conexión con una base de datos MongoDB usando variables de entorno seguras.
- **Carga Masiva de Datos**: Permite cargar múltiples archivos CSV en sus respectivas colecciones.
- **Estructura Modular**: Organiza el código en funciones específicas que mejoran la legibilidad y mantenibilidad.
- **Manejo de Excepciones**: Implementa un sistema robusto de manejo de errores para diferentes tipos de excepciones.
- **Logging Detallado**: Registra todas las operaciones en un archivo de log dedicado (`mongodb_insert.log`).

### Requisitos Adicionales

- **Bibliotecas Python**:
  - `pymongo`: Para conectar con bases de datos MongoDB.
  - `python-dotenv`: Para cargar variables de entorno desde un archivo `.env`.

### Configuración del Entorno

El script requiere las siguientes variables de entorno para funcionar correctamente:

- `MONGO_URI`: URI de conexión a MongoDB (ejemplo: `mongodb://localhost:27017`)
- `MONGO_DB`: Nombre de la base de datos

Estas variables deben definirse en un archivo `.env` en el directorio raíz del proyecto.

## Buenas Prácticas Implementadas

- **Modularidad**: Separación de la lógica en funciones reutilizables (`random_timestamp` y `create_dataframe`).
- **Escalabilidad**: Uso de variables configurables para definir la cantidad de registros por tabla.
- **Manejo de Errores**: Implementación de bloques `try-except` para gestionar excepciones durante la creación y guardado de archivos.
- **Documentación**: Uso de docstrings detallados y comentarios descriptivos para mejorar la legibilidad y mantenibilidad del código.
- **Organización de Directorios**: Estructura clara con un directorio dedicado (`./data/`) para almacenar los archivos generados.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, sigue estos pasos para contribuir:

1. **Fork** el proyecto.
2. **Crea** una nueva rama (`git checkout -b feature/nueva-caracteristica`).
3. **Commit** tus cambios (`git commit -m 'Añadir nueva característica'`).
4. **Push** a la rama (`git push origin feature/nueva-caracteristica`).
5. **Abre** un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, consulta el archivo [LICENSE](LICENSE).

## Contacto

Para cualquier consulta o sugerencia, por favor contacta a:

- **Nombre**: Hugo
- **Correo Electrónico**: hugoperez510@hotmail.com

---

¡Gracias por utilizar este generador de datos simulados!
