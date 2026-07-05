-- Vista previa de la importación de compensaciones desde
-- "D:\DIANE\RECUENTO DE HORAS EXTRAORDINARIAS\LISTADO COMPENSACIONES .xlsx"
-- Generado: 2026-07-05 10:44:25 -- Total de filas: 333
-- Revisar antes de aprobar la ejecución real (php importar-compensaciones.php --confirmar)

-- =====================================================
-- [1] Alvarez Zabala, Williams Wilman (49 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 1, 42.00, 21.12, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 2, 48.00, 38.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 3, 60.00, 60.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 4, 42.00, 0.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 5, 54.00, 38.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 6, 30.00, 24.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 7, 20.00, 43.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 8, 23.00, 17.25, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 10, 36.00, 28.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 11, 38.00, 33.60, 42.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2022, 12, 24.00, 21.12, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 1, 26.00, 14.95, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 2, 42.00, 39.90, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 3, 36.00, 28.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 4, 36.00, 27.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 5, 42.00, 31.50, 15.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 6, 30.00, 25.50, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 7, 41.00, 31.57, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 8, 42.00, 35.28, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 9, 32.00, 32.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 10, 36.00, 26.28, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 11, 36.00, 30.24, 22.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2023, 12, 36.00, 36.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 1, 39.00, 24.18, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 2, 42.00, 26.04, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 3, 36.00, 27.72, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 4, 38.00, 21.66, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 5, 43.00, 27.52, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 6, 44.00, 24.64, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 7, 42.00, 24.36, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 8, 6.00, 3.90, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 9, 42.00, 23.52, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 10, 42.00, 26.88, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 11, 36.00, 26.64, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2024, 12, 44.00, 27.28, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 1, 39.00, 13.20, 22.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 2, 22.00, 12.76, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 3, 30.00, 18.00, 28.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 4, 42.00, 26.88, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 5, 12.00, 6.84, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 6, 36.00, 19.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 7, 30.00, 18.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 8, 35.00, 23.10, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 9, 42.00, 25.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 10, 23.00, 14.95, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 11, 36.00, 22.32, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2025, 12, 36.00, 22.68, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2026, 1, 53.00, 23.32, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (1, 2026, 2, 50.00, 23.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [11] Garrido Suarez, Diane (44 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 1, 30.00, 27.30, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 2, 48.00, 38.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 4, 36.00, 28.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 5, 60.00, 42.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 6, 41.00, 32.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 7, 48.00, 33.60, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 8, 48.00, 36.00, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 9, 36.00, 30.60, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 10, 42.00, 33.60, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 11, 60.00, 48.00, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2022, 12, 28.00, 24.64, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 1, 60.00, 27.30, 13.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 2, 42.00, 39.90, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 3, 54.00, 43.20, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 4, 46.00, 34.50, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 5, 51.00, 38.25, 5.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 6, 53.00, 45.05, 23.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 7, 54.00, 41.58, 9.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 8, 52.00, 43.68, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 9, 42.00, 42.00, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 10, 54.00, 39.42, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 11, 48.00, 40.32, 11.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2023, 12, 35.00, 35.00, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 1, 53.00, 27.30, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 2, 36.00, 22.32, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 3, 0.00, 0.00, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 4, 59.00, 33.63, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 5, 53.00, 33.92, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 6, 30.00, 16.80, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 11, 21.00, 15.54, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2024, 12, 42.00, 26.04, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 1, 48.00, 28.80, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 2, 47.00, 27.26, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 3, 35.00, 25.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 4, 36.00, 23.04, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 5, 48.00, 27.36, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 6, 48.00, 26.40, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 7, 54.00, 32.40, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 8, 41.00, 26.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 9, 48.00, 28.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 10, 42.00, 27.30, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2025, 11, 41.00, 25.42, 21.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2026, 1, 30.00, 13.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (11, 2026, 2, 49.00, 22.54, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [3] Justiniano Flores, Maria Soledad (50 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 1, 4.00, 13.65, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 2, 16.00, 0.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 3, 34.00, 0.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 4, 24.00, 0.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 5, 29.00, 20.30, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 6, 23.00, 18.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 7, 36.00, 25.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 8, 36.00, 27.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 9, 36.00, 30.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 10, 5.00, 4.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 11, 32.00, 25.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2022, 12, 2.00, 1.76, 29.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 1, 29.00, 24.65, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 3, 32.00, 25.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 4, 31.00, 23.25, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 5, 21.00, 15.75, 10.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 6, 17.00, 14.45, 2.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 7, 36.00, 27.72, 2.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 8, 34.00, 28.56, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 9, 0.00, 0.00, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 10, 33.00, 24.09, 2.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 11, 14.00, 11.76, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2023, 12, 0.00, 0.00, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 1, 23.00, 13.65, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 2, 24.00, 14.88, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 3, 36.00, 27.72, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 4, 40.00, 22.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 5, 43.00, 27.52, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 6, 54.00, 30.24, 5.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 7, 55.00, 31.90, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 8, 54.00, 35.10, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 9, 19.00, 10.64, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 10, 35.00, 22.40, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 11, 0.00, 0.00, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2024, 12, 14.00, 8.68, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 1, 38.00, 22.80, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 2, 26.00, 14.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 3, 28.00, 13.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 4, 16.00, 10.24, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 5, 26.00, 11.97, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 6, 13.00, 7.15, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 7, 30.00, 15.60, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 8, 16.00, 12.65, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 9, 19.00, 11.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 10, 25.00, 13.65, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 11, 12.00, 7.44, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2025, 12, 28.00, 17.64, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2026, 1, 39.00, 17.16, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2026, 2, 25.00, 11.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (3, 2026, 3, 0.00, 0.00, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [4] Maertens Rodas, Rodrigo (48 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 1, 10.00, 10.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 2, 32.00, 25.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 3, 31.00, 31.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 5, 53.00, 37.10, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 6, 7.00, 5.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 7, 33.00, 23.10, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 8, 42.00, 31.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 9, 36.00, 30.60, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 10, 19.00, 30.40, 11.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2022, 12, 21.00, 18.48, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 2, 12.00, 11.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 3, 46.00, 36.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 4, 27.00, 20.25, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 5, 17.00, 12.75, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 6, 47.00, 39.95, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 7, 55.00, 42.35, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 8, 57.00, 47.88, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 9, 55.00, 55.00, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 10, 54.00, 39.42, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 11, 41.00, 34.44, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2023, 12, 32.00, 32.00, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 1, 60.00, 14.95, 32.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 2, 29.00, 17.98, 9.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 3, 1.00, 0.77, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 4, 6.00, 3.42, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 5, 39.00, 24.96, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 6, 59.00, 33.04, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 7, 60.00, 34.80, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 8, 46.00, 29.90, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 9, 58.00, 32.48, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 10, 54.00, 34.56, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 11, 36.00, 26.64, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2024, 12, 27.00, 16.74, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 1, 27.00, 16.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 2, 35.00, 16.24, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 3, 50.00, 28.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 4, 11.00, 0.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 5, 20.00, 18.24, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 6, 29.00, 15.95, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 7, 13.00, 7.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 8, 12.00, 10.45, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 9, 54.00, 24.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 10, 27.00, 14.95, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 11, 15.00, 9.32, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2025, 12, 35.00, 22.05, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2026, 1, 45.00, 19.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2026, 2, 21.00, 9.66, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (4, 2026, 3, 0.00, 0.00, 10.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [5] Perez Alba, Cecilia (46 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 1, 42.00, 42.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 3, 24.00, 24.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 4, 6.00, 0.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 5, 39.00, 27.30, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 7, 35.00, 28.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 8, 19.00, 14.25, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 9, 7.00, 5.95, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 10, 7.00, 5.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 11, 27.00, 21.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2022, 12, 6.00, 10.56, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 1, 39.00, 33.15, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 2, 16.00, 15.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 4, 30.00, 22.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 5, 16.00, 12.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 6, 20.00, 17.00, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 7, 33.00, 25.41, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 8, 36.00, 30.24, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 9, 17.00, 17.00, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 10, 30.00, 21.90, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 11, 8.00, 6.72, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2023, 12, 19.00, 13.00, 15.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 1, 39.00, 24.18, 4.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 2, 26.00, 16.12, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 3, 32.00, 24.64, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 4, 55.00, 31.35, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 5, 48.00, 30.72, 10.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 6, 57.00, 31.92, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 7, 60.00, 34.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 8, 53.00, 34.45, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 9, 50.00, 28.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 10, 24.00, 15.36, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2024, 12, 20.00, 12.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 1, 35.00, 21.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 2, 47.00, 27.26, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 3, 46.00, 16.80, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 4, 35.00, 22.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 5, 42.00, 23.94, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 6, 48.00, 26.40, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 7, 48.00, 28.80, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 8, 41.00, 26.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 9, 11.00, 15.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 10, 12.00, 13.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 11, 18.00, 11.16, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2025, 12, 51.00, 32.13, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2026, 1, 60.00, 26.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (5, 2026, 2, 43.00, 19.78, 28.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [7] Prieto Escalante, Rosmery (50 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 1, 30.00, 30.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 2, 60.00, 48.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 3, 21.00, 51.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 4, 48.00, 38.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 5, 48.00, 33.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 6, 18.00, 14.40, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 7, 48.00, 33.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 8, 48.00, 36.00, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 9, 42.00, 35.70, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 10, 42.00, 33.60, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 11, 54.00, 43.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2022, 12, 36.00, 31.68, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 1, 6.00, 5.10, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 2, 60.00, 57.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 3, 54.00, 43.20, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 4, 45.00, 33.75, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 5, 54.00, 40.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 6, 36.00, 30.60, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 7, 12.00, 9.24, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 8, 12.00, 10.08, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 9, 42.00, 42.00, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 10, 42.00, 30.66, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 11, 48.00, 40.32, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2023, 12, 48.00, 48.00, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 1, 48.00, 29.76, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 2, 48.00, 29.76, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 3, 24.00, 18.48, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 4, 48.00, 27.36, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 5, 30.00, 19.20, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 6, 42.00, 23.52, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 7, 48.00, 27.84, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 8, 36.00, 23.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 9, 48.00, 26.88, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 10, 42.00, 26.88, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 11, 30.00, 22.20, 24.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2024, 12, 48.00, 29.76, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 1, 42.00, 25.20, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 2, 60.00, 34.80, 18.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 3, 48.00, 28.80, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 4, 48.00, 30.72, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 5, 48.00, 27.36, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 6, 48.00, 26.40, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 7, 36.00, 21.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 8, 24.00, 13.20, 6.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 9, 48.00, 28.80, 12.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 10, 48.00, 31.20, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 11, 48.00, 29.76, 28.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2025, 12, 33.00, 20.79, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2026, 1, 60.00, 26.40, 24.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (7, 2026, 2, 24.00, 11.04, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

-- =====================================================
-- [6] Rodriguez Osinaga, Maria Luz Lucia (46 registros)
-- =====================================================
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 1, 30.00, 15.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 2, 42.00, 33.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 3, 54.00, 54.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 4, 30.00, 24.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 6, 42.00, 33.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 7, 42.00, 29.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 8, 48.00, 36.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 9, 36.00, 30.60, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 10, 42.00, 33.60, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 11, 48.00, 38.40, 10.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2022, 12, 32.00, 28.16, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 1, 38.00, 32.30, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 2, 42.00, 39.90, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 3, 48.00, 38.40, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 4, 42.00, 31.50, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 5, 48.00, 36.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 6, 0.00, 0.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 9, 24.00, 24.00, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 10, 42.00, 30.66, 8.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 11, 29.00, 24.36, 11.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2023, 12, 36.00, 36.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 1, 41.00, 25.42, 1.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 2, 36.00, 22.32, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 3, 36.00, 27.72, 3.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 4, 46.00, 26.22, 9.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 5, 41.00, 26.24, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 6, 48.00, 26.88, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 7, 48.00, 27.84, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 8, 48.00, 31.20, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 9, 36.00, 20.16, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 11, 42.00, 31.08, 14.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2024, 12, 42.00, 26.04, 13.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 1, 35.00, 25.20, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 2, 29.00, 20.88, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 3, 36.00, 21.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 4, 35.00, 26.88, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 5, 49.00, 27.93, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 6, 36.00, 19.80, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 7, 11.00, 6.60, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 8, 23.00, 16.50, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 9, 25.00, 15.00, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 10, 24.00, 15.60, 7.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 11, 31.00, 19.22, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2025, 12, 20.00, 14.72, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2026, 1, 30.00, 13.20, 21.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;
INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
VALUES (6, 2026, 2, 32.00, 14.72, 0.00)
ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;

