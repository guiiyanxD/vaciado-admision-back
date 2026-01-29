SELECT 
	TO_CHAR(fecha, 'YYYY-MM') AS PERIODO,
    SUM(CASE WHEN servicio = 'Medicina Interna' THEN ingreso ELSE 0 END) AS medicina_interna,
    SUM(CASE WHEN servicio = 'Medicina Cirugia' THEN ingreso ELSE 0 END) AS medicina_cirugia,
    SUM(CASE WHEN servicio = 'Infectologia' THEN ingreso ELSE 0 END) AS infectologia,
    SUM(CASE WHEN servicio = 'Pabellon Quirurgico' THEN ingreso ELSE 0 END) AS pabellon,
    SUM(CASE WHEN servicio = 'Neuro Trauma' THEN ingreso ELSE 0 END) AS neuro_trauma,
    SUM(CASE WHEN servicio = 'Ginecologia' THEN ingreso ELSE 0 END) AS ginecologia,
    SUM(CASE WHEN servicio = 'Neonatologia' THEN ingreso ELSE 0 END) AS neonatologia,
    SUM(CASE WHEN servicio = 'Pediatria' THEN ingreso ELSE 0 END) AS pediatria,
    SUM(CASE WHEN servicio = 'Onco Pediatria' THEN ingreso ELSE 0 END) AS onco_pediatria,
    SUM(CASE WHEN servicio = 'UCIM' THEN ingreso ELSE 0 END) AS ucim,
    SUM(CASE WHEN servicio = 'UTI PEDIATRIA' THEN ingreso ELSE 0 END) AS uti_pediatria,
    SUM(CASE WHEN servicio = 'UTI ADULTOS' THEN ingreso ELSE 0 END) AS uti_adultos,
    SUM(ingreso) AS total_dia -- Opcional: Suma total de todos los servicios
FROM censo
GROUP BY PERIODO
ORDER BY PERIODO asc;