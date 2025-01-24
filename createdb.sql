-- Materiales
CREATE TABLE Materiales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Empleados
CREATE TABLE Empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fk_nivel INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_empleado_nivel FOREIGN KEY (fk_nivel) REFERENCES Niveles(id)
);

-- Máquinas
CREATE TABLE Maquinas (
    no_serie VARCHAR(50) PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    fk_flujo INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_maquina_flujo FOREIGN KEY (fk_flujo) REFERENCES Flujos(id)
);

-- Productos
CREATE TABLE Productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Flujos
CREATE TABLE Flujos (
    id SERIAL PRIMARY KEY,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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

-- Niveles de Empleados
CREATE TABLE Niveles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Licencias
CREATE TABLE Licencias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fk_maquina VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_licencia_maquina FOREIGN KEY (fk_maquina) REFERENCES Maquinas(no_serie)
);

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

-- Producción
CREATE TABLE Producciones (
    id SERIAL PRIMARY KEY,
    cantidad_producto INT NOT NULL,
    fk_flujo INT NOT NULL,
    fecha DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_flujo FOREIGN KEY (fk_flujo) REFERENCES Flujos(id)
);

-- Metas de Producción
CREATE TABLE Metas (
    id SERIAL PRIMARY KEY,
    unidades INT NOT NULL,
    fk_producto INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_meta_producto FOREIGN KEY (fk_producto) REFERENCES Productos(id)
);

-- Detalle de Producción
CREATE TABLE Producciones_Detalles (
    id SERIAL PRIMARY KEY,
    fk_produccion INT NOT NULL,
    fk_meta INT NOT NULL,
    cumplio BOOLEAN NOT NULL DEFAULT FALSE,
    tiempo_muerto INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_produccion_detalle_produccion FOREIGN KEY (fk_produccion) REFERENCES Producciones(id),
    CONSTRAINT fk_produccion_detalle_meta FOREIGN KEY (fk_meta) REFERENCES Metas(id)
);

-- Relación Material-Producto
CREATE TABLE Materiales_Productos (
    id SERIAL PRIMARY KEY,
    fk_material INT NOT NULL,
    fk_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_material_producto_material FOREIGN KEY (fk_material) REFERENCES Materiales(id),
    CONSTRAINT fk_material_producto_producto FOREIGN KEY (fk_producto) REFERENCES Productos(id)
);
