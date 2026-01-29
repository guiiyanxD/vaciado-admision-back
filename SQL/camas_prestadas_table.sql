CREATE TABLE camas_prestadas (
    id SERIAL PRIMARY KEY,  -- ID autoincremental
    fecha DATE NOT NULL,
    servicio VARCHAR NOT NULL,
    especialidad VARCHAR NOT NULL,
    cantidad INTEGER NOT NULL,
    tipo_ingreso VARCHAR NOT NULL,
    -- Constraint único para evitar duplicados
    UNIQUE(fecha, servicio, especialidad, tipo_ingreso)
);