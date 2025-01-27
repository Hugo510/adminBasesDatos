
CREATE DATABASE Maquila;

\connect Maquila;

-- Materiales
CREATE TABLE Materiales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_materiales_nombre ON Materiales(nombre);

-- Empleados
CREATE TABLE Empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fk_nivel INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empleado_nivel FOREIGN KEY (fk_nivel) REFERENCES Niveles(id)
);
CREATE INDEX idx_empleados_nombre ON Empleados(nombre);

-- Máquinas
CREATE TABLE Maquinas (
    no_serie VARCHAR(50) PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    fk_flujo INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_maquina_flujo FOREIGN KEY (fk_flujo) REFERENCES Flujos(id)
);
CREATE INDEX idx_maquinas_tipo ON Maquinas(tipo);

-- Productos
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_productos_nombre ON Productos(nombre);

-- Flujos
CREATE TABLE Flujos (
    id SERIAL PRIMARY KEY,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_flujos_activo ON Flujos(activo);

-- Relación Producto-Flujo
CREATE TABLE Productos_Flujos (
    id SERIAL PRIMARY KEY,
    fk_producto INT NOT NULL,
    fk_flujo INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_producto_flujo_producto FOREIGN KEY (fk_producto) REFERENCES Productos(id),
    CONSTRAINT fk_producto_flujo_flujo FOREIGN KEY (fk_flujo) REFERENCES Flujos(id)
);
CREATE INDEX idx_productos_flujos_producto ON Productos_Flujos(fk_producto);
CREATE INDEX idx_productos_flujos_flujo ON Productos_Flujos(fk_flujo);

-- Niveles de Empleados
CREATE TABLE Niveles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_niveles_nombre ON Niveles(nombre);

-- Licencias
CREATE TABLE Licencias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    fk_maquina VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_licencia_maquina FOREIGN KEY (fk_maquina) REFERENCES Maquinas(no_serie)
);
CREATE INDEX idx_licencias_nombre ON Licencias(nombre);

-- Relación Operador-Licencia
CREATE TABLE Operadores_Licencias (
    id SERIAL PRIMARY KEY,
    fk_empleado INT NOT NULL,
    fk_licencia INT NOT NULL,
    fecha_expiracion DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_operador_licencia_empleado FOREIGN KEY (fk_empleado) REFERENCES Empleados(id),
    CONSTRAINT fk_operador_licencia_licencia FOREIGN KEY (fk_licencia) REFERENCES Licencias(id)
);
CREATE INDEX idx_operadores_licencias_empleado ON Operadores_Licencias(fk_empleado);
CREATE INDEX idx_operadores_licencias_licencia ON Operadores_Licencias(fk_licencia);

-- Producción
CREATE TABLE Producciones (
    id SERIAL PRIMARY KEY,
    cantidad_producto INT NOT NULL CHECK (cantidad_producto > 0),
    fk_flujo INT NOT NULL,
    fecha DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_flujo FOREIGN KEY (fk_flujo) REFERENCES Flujos(id)
);
CREATE INDEX idx_producciones_flujo ON Producciones(fk_flujo);
CREATE INDEX idx_producciones_fecha ON Producciones(fecha);

-- Metas de Producción
CREATE TABLE Metas (
    id SERIAL PRIMARY KEY,
    unidades INT NOT NULL CHECK (unidades > 0),
    fk_producto INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_meta_producto FOREIGN KEY (fk_producto) REFERENCES Productos(id)
);
CREATE INDEX idx_metas_producto ON Metas(fk_producto);

-- Detalle de Producción
CREATE TABLE Producciones_Detalles (
    id SERIAL PRIMARY KEY,
    fk_produccion INT NOT NULL,
    fk_meta INT NOT NULL,
    cumplio BOOLEAN NOT NULL DEFAULT FALSE,
    tiempo_muerto INT DEFAULT 0 CHECK (tiempo_muerto >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_detalle_produccion FOREIGN KEY (fk_produccion) REFERENCES Producciones(id),
    CONSTRAINT fk_produccion_detalle_meta FOREIGN KEY (fk_meta) REFERENCES Metas(id)
);
CREATE INDEX idx_producciones_detalles_produccion ON Producciones_Detalles(fk_produccion);
CREATE INDEX idx_producciones_detalles_meta ON Producciones_Detalles(fk_meta);

-- Relación Material-Producto
CREATE TABLE Materiales_Productos (
    id SERIAL PRIMARY KEY,
    fk_material INT NOT NULL,
    fk_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1 CHECK (cantidad > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_material_producto_material FOREIGN KEY (fk_material) REFERENCES Materiales(id),
    CONSTRAINT fk_material_producto_producto FOREIGN KEY (fk_producto) REFERENCES Productos(id)
);
CREATE INDEX idx_materiales_productos_material ON Materiales_Productos(fk_material);
CREATE INDEX idx_materiales_productos_producto ON Materiales_Productos(fk_producto);