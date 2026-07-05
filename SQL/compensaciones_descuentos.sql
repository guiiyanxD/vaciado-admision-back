-- ============================================================
-- DESCUENTOS DE HORAS PENDIENTES DE COMPENSACIÓN
-- ============================================================
-- No modifica los registros mensuales de `compensaciones` (historial real
-- de lo trabajado). Cada fila es un evento de descuento aplicado contra
-- el saldo pendiente de una gestión puntual de una persona.

CREATE TABLE IF NOT EXISTS compensaciones_descuentos (
    id                  SERIAL PRIMARY KEY,
    personal_id         INTEGER NOT NULL REFERENCES personal(id) ON DELETE RESTRICT,
    anho                SMALLINT NOT NULL CHECK (anho >= 2000 AND anho <= 2100),
    horas_descontadas   NUMERIC(7,2) NOT NULL CHECK (horas_descontadas > 0),
    fecha_descuento     DATE NOT NULL DEFAULT CURRENT_DATE,
    motivo              VARCHAR(255),
    creado_en           TIMESTAMP DEFAULT NOW()
);
