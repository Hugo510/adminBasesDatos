BEGIN;

-- Crear esquema para organizar las tablas
CREATE SCHEMA IF NOT EXISTS public;

-- Materiales
CREATE TABLE public.Materiales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_materiales_nombre ON public.Materiales(nombre);

-- Empleados
CREATE TABLE public.Empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fk_nivel INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empleado_nivel FOREIGN KEY (fk_nivel) REFERENCES public.Niveles(id)
);
CREATE INDEX idx_empleados_nombre ON public.Empleados(nombre);

-- Máquinas
CREATE TABLE public.Maquinas (
    no_serie VARCHAR(50) PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    fk_flujo INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_maquina_flujo FOREIGN KEY (fk_flujo) REFERENCES public.Flujos(id)
);
CREATE INDEX idx_maquinas_tipo ON public.Maquinas(tipo);

-- Productos
CREATE TABLE public.Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_productos_nombre ON public.Productos(nombre);

-- Flujos
CREATE TABLE public.Flujos (
    id SERIAL PRIMARY KEY,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_flujos_activo ON public.Flujos(activo);

-- Relación Producto-Flujo
CREATE TABLE public.Productos_Flujos (
    id SERIAL PRIMARY KEY,
    fk_producto INT NOT NULL,
    fk_flujo INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_producto_flujo_producto FOREIGN KEY (fk_producto) REFERENCES public.Productos(id),
    CONSTRAINT fk_producto_flujo_flujo FOREIGN KEY (fk_flujo) REFERENCES public.Flujos(id)
);
CREATE INDEX idx_productos_flujos_producto ON public.Productos_Flujos(fk_producto);
CREATE INDEX idx_productos_flujos_flujo ON public.Productos_Flujos(fk_flujo);

-- Niveles de Empleados
CREATE TABLE public.Niveles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_niveles_nombre ON public.Niveles(nombre);

-- Licencias
CREATE TABLE public.Licencias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    fk_maquina VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_licencia_maquina FOREIGN KEY (fk_maquina) REFERENCES public.Maquinas(no_serie)
);
CREATE INDEX idx_licencias_nombre ON public.Licencias(nombre);

-- Relación Operador-Licencia
CREATE TABLE public.Operadores_Licencias (
    id SERIAL PRIMARY KEY,
    fk_empleado INT NOT NULL,
    fk_licencia INT NOT NULL,
    fecha_expiracion DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_operador_licencia_empleado FOREIGN KEY (fk_empleado) REFERENCES public.Empleados(id) ON DELETE CASCADE,
    CONSTRAINT fk_operador_licencia_licencia FOREIGN KEY (fk_licencia) REFERENCES public.Licencias(id)
);
CREATE INDEX idx_operadores_licencias_empleado ON public.Operadores_Licencias(fk_empleado);
CREATE INDEX idx_operadores_licencias_licencia ON public.Operadores_Licencias(fk_licencia);

-- Producción
CREATE TABLE public.Producciones (
    id SERIAL PRIMARY KEY,
    cantidad_producto INT NOT NULL CHECK (cantidad_producto > 0),
    fk_flujo INT NOT NULL,
    fecha DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_flujo FOREIGN KEY (fk_flujo) REFERENCES public.Flujos(id)
);
CREATE INDEX idx_producciones_flujo ON public.Producciones(fk_flujo);
CREATE INDEX idx_producciones_fecha ON public.Producciones(fecha);

-- Metas de Producción
CREATE TABLE public.Metas (
    id SERIAL PRIMARY KEY,
    unidades INT NOT NULL CHECK (unidades > 0),
    fk_producto INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_meta_producto FOREIGN KEY (fk_producto) REFERENCES public.Productos(id)
);
CREATE INDEX idx_metas_producto ON public.Metas(fk_producto);

-- Detalle de Producción
CREATE TABLE public.Producciones_Detalles (
    id SERIAL PRIMARY KEY,
    fk_produccion INT NOT NULL,
    fk_meta INT NOT NULL,
    cumplio BOOLEAN NOT NULL DEFAULT FALSE,
    tiempo_muerto INT DEFAULT 0 CHECK (tiempo_muerto >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_detalle_produccion FOREIGN KEY (fk_produccion) REFERENCES public.Producciones(id),
    CONSTRAINT fk_produccion_detalle_meta FOREIGN KEY (fk_meta) REFERENCES public.Metas(id)
);
CREATE INDEX idx_producciones_detalles_produccion ON public.Producciones_Detalles(fk_produccion);
CREATE INDEX idx_producciones_detalles_meta ON public.Producciones_Detalles(fk_meta);

-- Relación Material-Producto
CREATE TABLE public.Materiales_Productos (
    id SERIAL PRIMARY KEY,
    fk_material INT NOT NULL,
    fk_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CHECK (cantidad > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_material_producto_material FOREIGN KEY (fk_material) REFERENCES public.Materiales(id),
    CONSTRAINT fk_material_producto_producto FOREIGN KEY (fk_producto) REFERENCES public.Productos(id)
);
CREATE INDEX idx_materiales_productos_material ON public.Materiales_Productos(fk_material);
CREATE INDEX idx_materiales_productos_producto ON public.Materiales_Productos(fk_producto);

-- Agregar comentarios descriptivos a las tablas
COMMENT ON TABLE public.Materiales IS 'Tabla que almacena los materiales utilizados en la producción.';
COMMENT ON TABLE public.Empleados IS 'Tabla que contiene la información de los empleados.';
-- ...añadir comentarios para otras tablas...

-- Definir roles y permisos
CREATE ROLE readonly;
GRANT CONNECT ON DATABASE Maquila TO readonly;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;

-- Optimizar índices existentes (ejemplo)
CREATE INDEX IF NOT EXISTS idx_materiales_nombre ON public.Materiales(nombre);

-- Agregar restricciones adicionales
ALTER TABLE public.Producciones
    ADD CONSTRAINT chk_cantidad_producto_positive CHECK (cantidad_producto > 0);

-- Implementar cascadas en claves foráneas
ALTER TABLE public.Operadores_Licencias
    DROP CONSTRAINT fk_operador_licencia_empleado,
    ADD CONSTRAINT fk_operador_licencia_empleado FOREIGN KEY (fk_empleado) REFERENCES public.Empleados(id) ON DELETE CASCADE;

-- ...aplicar cascadas a otras claves foráneas según sea necesario...

COMMIT;
