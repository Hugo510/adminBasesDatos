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
- **Correo Electrónico**: hugo@example.com

---

¡Gracias por utilizar este generador de datos simulados!
