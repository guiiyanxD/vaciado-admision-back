-- =====================================================
-- Script SQL Completo para PostgreSQL
-- Sistema de Censo/Movimiento Hospitalario
-- =====================================================

-- =====================================================
-- TABLA 1: SERVICIOS (Catálogo)
-- =====================================================

CREATE TABLE IF NOT EXISTS servicios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    cant_camas INTEGER NOT NULL CHECK (cant_camas > 0),
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE servicios IS 'Catálogo de servicios hospitalarios';
COMMENT ON COLUMN servicios.id IS 'Identificador único del servicio';
COMMENT ON COLUMN servicios.nombre IS 'Nombre del servicio (ej: Medicina Interna, Cirugía)';
COMMENT ON COLUMN servicios.cant_camas IS 'Cantidad total de camas del servicio (dotación)';
COMMENT ON COLUMN servicios.activo IS 'Indica si el servicio está activo';

-- Datos de ejemplo (ajustar según tus servicios reales)
INSERT INTO servicios (nombre, cant_camas) VALUES
('Medicina Interna', 30),
('Cirugía', 25),
('Pediatría', 20),
('Ginecología', 15),
('Traumatología', 18),
('UCI', 12)
ON CONFLICT (nombre) DO NOTHING;

-- =====================================================
-- TABLA 2: ESPECIALIDADES (Catálogo)
-- =====================================================

CREATE TABLE IF NOT EXISTS especialidades (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE especialidades IS 'Catálogo de especialidades médicas';
COMMENT ON COLUMN especialidades.id IS 'Identificador único de la especialidad';
COMMENT ON COLUMN especialidades.nombre IS 'Nombre de la especialidad';

-- Datos de ejemplo (ajustar según tus especialidades reales)
INSERT INTO especialidades (nombre) VALUES
('Medicina Interna'),
('Cirugía General'),
('Pediatría'),
('Ginecología y Obstetricia'),
('Traumatología'),
('Cardiología'),
('Neurología'),
('Oncología'),
('Nefrología'),
('Neumología')
ON CONFLICT (nombre) DO NOTHING;

-- =====================================================
-- TABLA 3: CENSO / MOVIMIENTO HOSPITALARIO (Principal)
-- =====================================================

CREATE TABLE IF NOT EXISTS censo (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    
    -- Ingresos
    ingreso INTEGER NOT NULL DEFAULT 0 CHECK (ingreso >= 0),
    ingreso_traslado INTEGER NOT NULL DEFAULT 0 CHECK (ingreso_traslado >= 0),
    
    -- Egresos
    egreso INTEGER NOT NULL DEFAULT 0 CHECK (egreso >= 0),
    egreso_traslado INTEGER NOT NULL DEFAULT 0 CHECK (egreso_traslado >= 0),
    obito INTEGER NOT NULL DEFAULT 0 CHECK (obito >= 0),
    
    -- Estado de camas
    aislamiento INTEGER NOT NULL DEFAULT 0 CHECK (aislamiento >= 0),
    bloqueada INTEGER NOT NULL DEFAULT 0 CHECK (bloqueada >= 0),
    total INTEGER NOT NULL DEFAULT 0 CHECK (total >= 0),
    libre INTEGER NOT NULL DEFAULT 0 CHECK (libre >= 0),
    dotacion INTEGER NOT NULL DEFAULT 0 CHECK (dotacion >= 0),
    
    -- Auditoría
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraint único: solo un censo por fecha y servicio
    CONSTRAINT uk_censo_fecha_servicio UNIQUE (fecha, servicio),
    
    -- Foreign key al catálogo de servicios
    CONSTRAINT fk_censo_servicio FOREIGN KEY (servicio) 
        REFERENCES servicios(nombre) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);

-- Índices para mejorar performance
CREATE INDEX IF NOT EXISTS idx_censo_fecha ON censo(fecha);
CREATE INDEX IF NOT EXISTS idx_censo_servicio ON censo(servicio);
CREATE INDEX IF NOT EXISTS idx_censo_fecha_servicio ON censo(fecha, servicio);

-- Comentarios de documentación
COMMENT ON TABLE censo IS 'Registro diario de movimiento hospitalario por servicio';
COMMENT ON COLUMN censo.id IS 'Identificador único autoincremental';
COMMENT ON COLUMN censo.fecha IS 'Fecha del censo';
COMMENT ON COLUMN censo.servicio IS 'Servicio hospitalario (FK a servicios.nombre)';
COMMENT ON COLUMN censo.ingreso IS 'Número de ingresos directos en el día';
COMMENT ON COLUMN censo.ingreso_traslado IS 'Número de ingresos por traslado';
COMMENT ON COLUMN censo.egreso IS 'Número de egresos directos';
COMMENT ON COLUMN censo.egreso_traslado IS 'Número de egresos por traslado';
COMMENT ON COLUMN censo.obito IS 'Número de fallecimientos';
COMMENT ON COLUMN censo.aislamiento IS 'Número de camas en aislamiento';
COMMENT ON COLUMN censo.bloqueada IS 'Número de camas bloqueadas';
COMMENT ON COLUMN censo.total IS 'Total de pacientes en 24 horas';
COMMENT ON COLUMN censo.libre IS 'Número de camas libres';
COMMENT ON COLUMN censo.dotacion IS 'Dotación total de camas del servicio';

-- =====================================================
-- TABLA 4: CAMAS PRESTADAS (Relacional)
-- =====================================================

CREATE TABLE IF NOT EXISTS camas_prestadas (
    id SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    servicio VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    tipo_ingreso VARCHAR(20) NOT NULL CHECK (tipo_ingreso IN ('DIRECTO', 'TRASLADO')),
    
    -- Auditoría
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Constraint único para evitar duplicados
    CONSTRAINT uk_camas_prestadas UNIQUE (fecha, servicio, especialidad, tipo_ingreso),
    
    -- Foreign key a censo (fecha + servicio)
    CONSTRAINT fk_camas_censo 
        FOREIGN KEY (fecha, servicio) 
        REFERENCES censo(fecha, servicio) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    
    -- Foreign key al catálogo de servicios
    CONSTRAINT fk_camas_servicio 
        FOREIGN KEY (servicio) 
        REFERENCES servicios(nombre) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT,
    
    -- Foreign key al catálogo de especialidades
    CONSTRAINT fk_camas_especialidad 
        FOREIGN KEY (especialidad) 
        REFERENCES especialidades(nombre) 
        ON UPDATE CASCADE 
        ON DELETE RESTRICT
);

-- Índices para mejorar performance
CREATE INDEX IF NOT EXISTS idx_camas_fecha_servicio ON camas_prestadas(fecha, servicio);
CREATE INDEX IF NOT EXISTS idx_camas_fecha ON camas_prestadas(fecha);
CREATE INDEX IF NOT EXISTS idx_camas_servicio ON camas_prestadas(servicio);
CREATE INDEX IF NOT EXISTS idx_camas_especialidad ON camas_prestadas(especialidad);

-- Comentarios de documentación
COMMENT ON TABLE camas_prestadas IS 'Registro de camas prestadas a otras especialidades';
COMMENT ON COLUMN camas_prestadas.id IS 'Identificador único autoincremental';
COMMENT ON COLUMN camas_prestadas.fecha IS 'Fecha del censo (FK a censo.fecha)';
COMMENT ON COLUMN camas_prestadas.servicio IS 'Servicio que presta la cama (FK a censo.servicio y servicios.nombre)';
COMMENT ON COLUMN camas_prestadas.especialidad IS 'Especialidad a la que se presta (FK a especialidades.nombre)';
COMMENT ON COLUMN camas_prestadas.cantidad IS 'Número de camas prestadas';
COMMENT ON COLUMN camas_prestadas.tipo_ingreso IS 'Tipo de ingreso: DIRECTO o TRASLADO';

-- =====================================================
-- TRIGGERS PARA ACTUALIZAR updated_at AUTOMÁTICAMENTE
-- =====================================================

-- Función genérica para actualizar updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger para tabla servicios
DROP TRIGGER IF EXISTS update_servicios_updated_at ON servicios;
CREATE TRIGGER update_servicios_updated_at
    BEFORE UPDATE ON servicios
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para tabla especialidades
DROP TRIGGER IF EXISTS update_especialidades_updated_at ON especialidades;
CREATE TRIGGER update_especialidades_updated_at
    BEFORE UPDATE ON especialidades
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para tabla censo
DROP TRIGGER IF EXISTS update_censo_updated_at ON censo;
CREATE TRIGGER update_censo_updated_at
    BEFORE UPDATE ON censo
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Trigger para tabla camas_prestadas
DROP TRIGGER IF EXISTS update_camas_prestadas_updated_at ON camas_prestadas;
CREATE TRIGGER update_camas_prestadas_updated_at
    BEFORE UPDATE ON camas_prestadas
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- VISTAS ÚTILES PARA REPORTES
-- =====================================================

-- Vista 1: Resumen de camas prestadas por fecha y servicio
CREATE OR REPLACE VIEW v_resumen_camas_prestadas AS
SELECT 
    fecha,
    servicio,
    COUNT(*) as total_registros,
    SUM(cantidad) as total_camas_prestadas,
    STRING_AGG(DISTINCT especialidad, ', ' ORDER BY especialidad) as especialidades,
    STRING_AGG(
        especialidad || ' (' || cantidad || ' ' || tipo_ingreso || ')', 
        '; ' 
        ORDER BY especialidad
    ) as detalle
FROM camas_prestadas
GROUP BY fecha, servicio
ORDER BY fecha DESC, servicio;

COMMENT ON VIEW v_resumen_camas_prestadas IS 'Resumen de camas prestadas agrupadas por fecha y servicio';

-- Vista 2: Censo completo con camas prestadas
CREATE OR REPLACE VIEW v_censo_completo AS
SELECT 
    c.id,
    c.fecha,
    c.servicio,
    s.cant_camas as dotacion_servicio,
    c.ingreso,
    c.ingreso_traslado,
    c.egreso,
    c.egreso_traslado,
    c.obito,
    c.aislamiento,
    c.bloqueada,
    c.total,
    c.libre,
    c.dotacion,
    COALESCE(cp.total_camas_prestadas, 0) as camas_prestadas,
    COALESCE(cp.detalle, 'Sin camas prestadas') as detalle_camas_prestadas,
    c.created_at,
    c.updated_at
FROM censo c
LEFT JOIN servicios s ON c.servicio = s.nombre
LEFT JOIN v_resumen_camas_prestadas cp 
    ON c.fecha = cp.fecha 
    AND c.servicio = cp.servicio
ORDER BY c.fecha DESC, c.servicio;

COMMENT ON VIEW v_censo_completo IS 'Vista combinada de censo con información de servicio y camas prestadas';

-- Vista 3: Estadísticas diarias generales
CREATE OR REPLACE VIEW v_estadisticas_diarias AS
SELECT 
    fecha,
    COUNT(DISTINCT servicio) as servicios_registrados,
    SUM(ingreso) as total_ingresos,
    SUM(ingreso_traslado) as total_ingresos_traslado,
    SUM(egreso) as total_egresos,
    SUM(egreso_traslado) as total_egresos_traslado,
    SUM(obito) as total_obitos,
    SUM(total) as total_pacientes,
    SUM(libre) as total_camas_libres,
    SUM(bloqueada) as total_camas_bloqueadas,
    SUM(aislamiento) as total_aislamientos,
    AVG((libre::FLOAT / NULLIF(dotacion, 0)) * 100) as porcentaje_ocupacion_promedio
FROM censo
GROUP BY fecha
ORDER BY fecha DESC;

COMMENT ON VIEW v_estadisticas_diarias IS 'Estadísticas generales por fecha de todos los servicios';

-- Vista 4: Servicios con mayor movimiento
CREATE OR REPLACE VIEW v_servicios_con_mayor_movimiento AS
SELECT 
    servicio,
    COUNT(*) as dias_registrados,
    SUM(ingreso + ingreso_traslado) as total_ingresos,
    SUM(egreso + egreso_traslado + obito) as total_egresos,
    AVG(total) as promedio_pacientes,
    MAX(total) as max_pacientes,
    MIN(total) as min_pacientes,
    AVG((libre::FLOAT / NULLIF(dotacion, 0)) * 100) as porcentaje_ocupacion_promedio
FROM censo
GROUP BY servicio
ORDER BY total_ingresos DESC;

COMMENT ON VIEW v_servicios_con_mayor_movimiento IS 'Estadísticas de movimiento por servicio';

-- =====================================================
-- DATOS DE EJEMPLO (OPCIONAL - Solo para testing)
-- =====================================================

-- Descomentar para insertar datos de prueba:
/*
-- Insertar censo de ejemplo
INSERT INTO censo (fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, aislamiento, bloqueada, total, libre, dotacion) VALUES
('2024-12-01', 'Medicina Interna', 5, 2, 3, 1, 0, 2, 1, 25, 5, 30),
('2024-12-01', 'Cirugía', 3, 1, 2, 0, 0, 1, 0, 20, 5, 25),
('2024-12-02', 'Medicina Interna', 4, 1, 2, 1, 1, 2, 1, 24, 6, 30),
('2024-12-02', 'Cirugía', 2, 2, 3, 1, 0, 1, 0, 19, 6, 25);

-- Insertar camas prestadas de ejemplo
INSERT INTO camas_prestadas (fecha, servicio, especialidad, cantidad, tipo_ingreso) VALUES
('2024-12-01', 'Medicina Interna', 'Cirugía General', 2, 'DIRECTO'),
('2024-12-01', 'Medicina Interna', 'Pediatría', 1, 'TRASLADO'),
('2024-12-02', 'Cirugía', 'Traumatología', 3, 'DIRECTO');
*/

-- =====================================================
-- CONSULTAS ÚTILES PARA VERIFICACIÓN
-- =====================================================

-- Ver todas las tablas creadas
-- SELECT tablename FROM pg_tables WHERE schemaname = 'public';

-- Ver todas las foreign keys
-- SELECT conname, conrelid::regclass, confrelid::regclass 
-- FROM pg_constraint WHERE contype = 'f';

-- Ver censo con camas prestadas
-- SELECT * FROM v_censo_completo WHERE fecha = CURRENT_DATE;

-- Ver estadísticas del día
-- SELECT * FROM v_estadisticas_diarias WHERE fecha = CURRENT_DATE;

-- Ver servicios más activos
-- SELECT * FROM v_servicios_con_mayor_movimiento LIMIT 10;

-- =====================================================
-- SCRIPT DE LIMPIEZA (USAR CON PRECAUCIÓN)
-- =====================================================

-- Para eliminar todo y empezar de cero (CUIDADO: borra todos los datos):
/*
DROP VIEW IF EXISTS v_servicios_con_mayor_movimiento;
DROP VIEW IF EXISTS v_estadisticas_diarias;
DROP VIEW IF EXISTS v_censo_completo;
DROP VIEW IF EXISTS v_resumen_camas_prestadas;

DROP TRIGGER IF EXISTS update_camas_prestadas_updated_at ON camas_prestadas;
DROP TRIGGER IF EXISTS update_censo_updated_at ON censo;
DROP TRIGGER IF EXISTS update_especialidades_updated_at ON especialidades;
DROP TRIGGER IF EXISTS update_servicios_updated_at ON servicios;

DROP FUNCTION IF EXISTS update_updated_at_column();

DROP TABLE IF EXISTS camas_prestadas CASCADE;
DROP TABLE IF EXISTS censo CASCADE;
DROP TABLE IF EXISTS especialidades CASCADE;
DROP TABLE IF EXISTS servicios CASCADE;
*/

-- =====================================================
-- FIN DEL SCRIPT
-- =====================================================

-- Para ejecutar este script:
-- psql -U tu_usuario -d movimiento_hospitalario -f crear_tablas_completo.sql

-- Para verificar que todo se creó correctamente:
-- \dt   -- Ver tablas
-- \dv   -- Ver vistas
-- \df   -- Ver funciones
-- \d nombre_tabla  -- Ver estructura de una tabla específica