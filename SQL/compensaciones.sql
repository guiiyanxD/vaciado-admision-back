-- ============================================================
-- MÓDULO DE COMPENSACIONES / HORAS EXTRAS
-- ============================================================

-- Tabla de personal de la oficina
CREATE TABLE IF NOT EXISTS personal (
    id          SERIAL PRIMARY KEY,
    nombres     VARCHAR(100) NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    activo      BOOLEAN NOT NULL DEFAULT TRUE,
    creado_en   TIMESTAMP DEFAULT NOW()
);

-- Tabla de registros mensuales de compensaciones
CREATE TABLE IF NOT EXISTS compensaciones (
    id                  SERIAL PRIMARY KEY,
    personal_id         INTEGER NOT NULL REFERENCES personal(id) ON DELETE RESTRICT,
    anho                SMALLINT NOT NULL CHECK (anho >= 2000 AND anho <= 2100),
    mes                 SMALLINT NOT NULL CHECK (mes >= 1 AND mes <= 12),
    horas_programadas   NUMERIC(7,2) NOT NULL DEFAULT 0,
    horas_pagadas       NUMERIC(7,2) NOT NULL DEFAULT 0,
    permisos_horas      NUMERIC(7,2) NOT NULL DEFAULT 0,
    saldo_horas         NUMERIC(7,2) GENERATED ALWAYS AS (horas_programadas - horas_pagadas - permisos_horas) STORED,
    creado_en           TIMESTAMP DEFAULT NOW(),
    actualizado_en      TIMESTAMP DEFAULT NOW(),
    CONSTRAINT uq_compensacion_persona_mes UNIQUE (personal_id, anho, mes)
);

-- Trigger para actualizar timestamp en cada UPDATE
CREATE OR REPLACE FUNCTION fn_actualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.actualizado_en = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_compensaciones_update
    BEFORE UPDATE ON compensaciones
    FOR EACH ROW EXECUTE FUNCTION fn_actualizar_timestamp();

-- Datos iniciales de personal (tomados del Excel)
INSERT INTO personal (nombres, apellidos) VALUES
    ('Williams Wilman', 'Alvarez Zabala'),
    ('Diane',           'Garrido Suarez'),
    ('Maria Soledad',   'Justiniano Flores'),
    ('Rodrigo',         'Maertens Rodas'),
    ('Cecilia',         'Perez Alba'),
    ('Maria Luz Lucia', 'Rodriguez Osinaga'),
    ('Rosmery',         'Prieto Escalante')
ON CONFLICT DO NOTHING;