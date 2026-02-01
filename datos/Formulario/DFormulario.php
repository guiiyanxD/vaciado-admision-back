<?php

/**
 * Modelo de Datos Refactorizado para Censo y Camas Prestadas
 * 
 * Maneja operaciones CRUD con PostgreSQL
 */
require_once("../config/connection.php");
require_once("../config/Pgsql.php");
class DFormulario {
    
    private $conexion;
    private $pdo;
    
    public function __construct() {
        $this->conexion = PgsqlConnection::getInstance();
        $this->pdo = $this->conexion->getConnection();
    }

    // =====================================================
    // TRANSACCIONES
    // =====================================================

    public function iniciarTransaccion() {
        $this->pdo->beginTransaction();
    }

    public function confirmarTransaccion() {
        $this->pdo->commit();
    }

    public function revertirTransaccion() {
        $this->pdo->rollBack();
    }

    // =====================================================
    // VALIDACIONES (NUEVO)
    // =====================================================

    /**
     * Verificar que un servicio existe en la tabla servicios
     * 
     * @param string $nombreServicio
     * @return bool
     */
    private function servicioExiste($nombreServicio) {
        $query = "SELECT COUNT(*) as total FROM servicios WHERE nombre = :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([':nombre' => $nombreServicio]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'] > 0;
    }

    public function getTotalAyer($fecha, $servicio){
        $query = "SELECT total FROM censo  
                  WHERE fecha = (select MAX(fecha) from censo) AND servicio = :servicio";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':servicio' => $servicio
        ]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'];
    }

    /**
     * Verificar que una especialidad existe en la tabla especialidades
     * 
     * @param string $nombreEspecialidad
     * @return bool
     */
    private function especialidadExiste($nombreEspecialidad) {
        $query = "SELECT COUNT(*) as total FROM especialidades WHERE nombre = :nombre";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([':nombre' => $nombreEspecialidad]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'] > 0;
    }

    // =====================================================
    // CENSO PRINCIPAL
    // =====================================================

    /**
     * Verificar si existe un censo y guardarlo/actualizarlo
     * 
     * @param array $data Datos del censo
     * @return int Número de filas afectadas
     */
    public function verificarYGuardar($data) {
        // NUEVO: Validar que el servicio existe
        if (!$this->servicioExiste($data['servicio'])) {
            throw new Exception("El servicio '{$data['servicio']}' no existe en el catálogo de servicios");
        }

        // Verificar si ya existe un registro para esta fecha + servicio
        $existe = $this->verificarExistencia($data['fecha'], $data['servicio']);

        if ($existe) {
            // Actualizar registro existente
            return $this->actualizarCenso($data);
        } else {
            // Insertar nuevo registro
            return $this->insertarCenso($data);
        }
    }

    /**
     * Verificar si existe un censo para una fecha y servicio
     * 
     * @param string $fecha
     * @param string $servicio
     * @return bool
     */
    private function verificarExistencia($fecha, $servicio) {
        $query = "SELECT COUNT(*) as total FROM censo 
                  WHERE fecha = :fecha AND servicio = :servicio";
        
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':fecha' => $fecha,
            ':servicio' => $servicio
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'] > 0;
    }

    /**
     * Insertar nuevo censo
     * 
     * @param array $data
     * @return int Filas insertadas
     */
    private function insertarCenso($data) {
        $query = "INSERT INTO censo (
                    fecha, servicio, ingreso, ingreso_traslado, 
                    egreso, egreso_traslado, obito, aislamiento, 
                    bloqueada, total, libre, dotacion
                  ) VALUES (
                    :fecha, :servicio, :ingreso, :ingreso_traslado, 
                    :egreso, :egreso_traslado, :obito, :aislamiento, 
                    :bloqueada, :total, :libre, :dotacion
                  )";

        $stmt = $this->pdo->prepare($query);
        
        $result = $stmt->execute([
            ':fecha' => $data['fecha'],
            ':servicio' => $data['servicio'],
            ':ingreso' => (int)$data['ingreso'],
            ':ingreso_traslado' => (int)$data['ingreso_traslado'],
            ':egreso' => (int)$data['egreso'],
            ':egreso_traslado' => (int)$data['egreso_traslado'],
            ':obito' => (int)$data['obito'],
            ':aislamiento' => (int)$data['aislamiento'],
            ':bloqueada' => (int)$data['bloqueada'],
            ':total' => (int)$data['total'],
            ':libre' => (int)$data['libre'],
            ':dotacion' => (int)$data['dotacion']
        ]);

        if (!$result) {
            throw new Exception("Error al insertar censo");
        }

        return $stmt->rowCount();
    }

    /**
     * Actualizar censo existente
     * 
     * @param array $data
     * @return int Filas actualizadas
     */
    private function actualizarCenso($data) {
        $query = "UPDATE censo SET 
                    ingreso = :ingreso,
                    ingreso_traslado = :ingreso_traslado,
                    egreso = :egreso,
                    egreso_traslado = :egreso_traslado,
                    obito = :obito,
                    aislamiento = :aislamiento,
                    bloqueada = :bloqueada,
                    total = :total,
                    libre = :libre,
                    dotacion = :dotacion
                  WHERE fecha = :fecha AND servicio = :servicio";

        $stmt = $this->pdo->prepare($query);
        
        $result = $stmt->execute([
            ':fecha' => $data['fecha'],
            ':servicio' => $data['servicio'],
            ':ingreso' => (int)$data['ingreso'],
            ':ingreso_traslado' => (int)$data['ingreso_traslado'],
            ':egreso' => (int)$data['egreso'],
            ':egreso_traslado' => (int)$data['egreso_traslado'],
            ':obito' => (int)$data['obito'],
            ':aislamiento' => (int)$data['aislamiento'],
            ':bloqueada' => (int)$data['bloqueada'],
            ':total' => (int)$data['total'],
            ':libre' => (int)$data['libre'],
            ':dotacion' => (int)$data['dotacion']
        ]);

        if (!$result) {
            throw new Exception("Error al actualizar censo");
        }

        return $stmt->rowCount();
    }

    // =====================================================
    // CAMAS PRESTADAS
    // =====================================================

    /**
     * Guardar múltiples camas prestadas
     * 
     * @param array $camasPrestadas Array de camas con estructura:
     *                              [ {fecha, servicio, especialidad, cantidad, tipo_ingreso}, ... ]
     * @return int Total de filas insertadas
     */
    public function guardarCamasPrestadas($camasPrestadas) {
        if (empty($camasPrestadas)) {
            return 0;
        }

        $totalInsertadas = 0;

        // Query con INSERT ... ON CONFLICT (requiere PostgreSQL 9.5+)
        $query = "INSERT INTO camas_prestadas (
                    fecha, servicio, especialidad, cantidad, tipo_ingreso
                  ) VALUES (
                    :fecha, :servicio, :especialidad, :cantidad, :tipo_ingreso
                  )
                  ON CONFLICT (fecha, servicio, especialidad, tipo_ingreso) 
                  DO UPDATE SET cantidad = EXCLUDED.cantidad";

        $stmt = $this->pdo->prepare($query);

        foreach ($camasPrestadas as $cama) {
            // NUEVO: Validar que la especialidad existe
            if (!$this->especialidadExiste($cama['especialidad'])) {
                // Opción 1: Lanzar excepción (estricto)
                throw new Exception("La especialidad '{$cama['especialidad']}' no existe en el catálogo");
                
                // Opción 2: Saltar esta cama y continuar (tolerante)
                // continue;
            }

            $result = $stmt->execute([
                ':fecha' => $cama['fecha'],
                ':servicio' => $cama['servicio'],
                ':especialidad' => $cama['especialidad'],
                ':cantidad' => (int)$cama['cantidad'],
                ':tipo_ingreso' => $cama['tipo_ingreso']
            ]);

            if (!$result) {
                throw new Exception("Error al guardar cama prestada");
            }

            $totalInsertadas += $stmt->rowCount();
        }

        return $totalInsertadas;
    }

    /**
     * Eliminar todas las camas prestadas de una fecha y servicio específico
     * 
     * @param string $fecha
     * @param string $servicio
     * @return int Filas eliminadas
     */
    public function eliminarCamasPrestadas($fecha, $servicio) {
        $query = "DELETE FROM camas_prestadas 
                  WHERE fecha = :fecha AND servicio = :servicio";

        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':fecha' => $fecha,
            ':servicio' => $servicio
        ]);

        return $stmt->rowCount();
    }

    /**
     * Obtener todas las camas prestadas de un censo específico
     * 
     * @param string $fecha
     * @param string $servicio
     * @return array Array de camas prestadas
     */
    public function obtenerCamasPrestadas($fecha, $servicio) {
        $query = "SELECT id, fecha, servicio, especialidad, cantidad, tipo_ingreso 
                  FROM camas_prestadas 
                  WHERE fecha = :fecha AND servicio = :servicio
                  ORDER BY especialidad, tipo_ingreso";

        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':fecha' => $fecha,
            ':servicio' => $servicio
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtener el total de camas prestadas por servicio en una fecha
     * 
     * @param string $fecha
     * @param string $servicio
     * @return int Total de camas prestadas
     */
    public function contarCamasPrestadas($fecha, $servicio) {
        $query = "SELECT COALESCE(SUM(cantidad), 0) as total 
                  FROM camas_prestadas 
                  WHERE fecha = :fecha AND servicio = :servicio";

        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':fecha' => $fecha,
            ':servicio' => $servicio
        ]);

        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'];
    }

    // =====================================================
    // CONSULTAS COMBINADAS
    // =====================================================

    /**
     * Obtener censo completo con sus camas prestadas
     * 
     * @param string $fecha
     * @param string $servicio
     * @return array|null Datos completos o null si no existe
     */
    public function obtenerCensoCompleto($fechaInicio, $servicio) {
        if($servicio == 'todos'){
            $queryCenso = "SELECT fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, 
            aislamiento, bloqueada, total FROM censo WHERE fecha = :fechaInicio";
            $params = [':fechaInicio' => $fechaInicio];    
        }else{
            $queryCenso = "SELECT fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, 
            aislamiento, bloqueada, total FROM censo WHERE fecha = :fechaInicio AND servicio = :servicio";
            $params = [
                ':fechaInicio' => $fechaInicio,
                ':servicio' => $servicio
            ];
        }
        
        $stmt = $this->pdo->prepare($queryCenso);
        $stmt->execute($params);
        $censo = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!$censo) {
            return null;
        }

        //$censo['camas_prestadas'] = $this->obtenerCamasPrestadas($fechaInicio, $servicio);
        $array = [$censo];

        return $censo;
    }
    
    public function obtenerCensoCompletoRangoFechas($fechaInicio, $fechaFin, $servicio) {
        if($servicio == 'todos'){
            $queryCenso = "SELECT fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, aislamiento, 
                bloqueada, total FROM censo WHERE fecha >= :fechaInicio AND fecha <= :fechaFin";
            $params = [
                ':fechaInicio' => $fechaInicio,
                ':fechaFin' => $fechaFin
            ];       
        }else {
            $queryCenso = "SELECT fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, aislamiento, 
                bloqueada, total FROM censo WHERE fecha >= :fechaInicio AND fecha <= :fechaFin AND servicio = :servicio";
            $params = [
                ':fechaInicio' => $fechaInicio,
                ':fechaFin' => $fechaFin,
                ':servicio' => $servicio
            ];       
        }
        
        $stmt = $this->pdo->prepare($queryCenso);
        $stmt->execute($params);
        $censo = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!$censo) {
            return null;
        }

        // Obtener camas prestadas
        //$censo['camas_prestadas'] = $this->obtenerCamasPrestadas($fechaInicio, $servicio);

        return $censo;
    }

    public function obtenerCensoCompletoAgruparMes($fechaInicio, $fechaFin, $servicio) {
        $queryCenso = "SELECT extract(month from fecha) as mes, extract(year from fecha) as anho, fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, aislamiento, 
        bloqueada, total FROM censo WHERE fecha >= :fechaInicio AND fecha <= :fechaFin AND servicio = :servicio group by  anho, mes, fecha, servicio, ingreso, ingreso_traslado, egreso, egreso_traslado, obito, aislamiento, bloqueada, total order by anho, mes";
        $stmt = $this->pdo->prepare($queryCenso);
        $stmt->execute([
            ':fechaInicio' => $fechaInicio,
            ':fechaFin' => $fechaFin,
            ':servicio' => $servicio
        ]);

        $censo = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!$censo) {
            return null;
        }

        // Obtener camas prestadas
        //$censo['camas_prestadas'] = $this->obtenerCamasPrestadas($fechaInicio, $servicio);

        return $censo;
    }

    public function reporteMensual($fechaInicio, $fechaFin){
        $movimientos = ['ingreso', 'ingreso_traslado', 'egreso', 'egreso_traslado', 'obito', 'aislamiento', 'bloqueada', 'total'];

        for($i=0; $i < count($movimientos); $i++){
            $queryCenso = "SELECT 
                TO_CHAR(fecha, 'YYYY-MM-DD') AS PERIODO,
                SUM(CASE WHEN servicio = 'Medicina Interna' THEN " . $movimientos[$i] . " ELSE 0 END) AS Medicina_Interna,
                SUM(CASE WHEN servicio = 'Medicina Cirugia' THEN " . $movimientos[$i] . " ELSE 0 END) AS Medicina_Cirugia,
                SUM(CASE WHEN servicio = 'Infectologia' THEN " . $movimientos[$i] . " ELSE 0 END) AS Infectologia,
                SUM(CASE WHEN servicio = 'Pabellon Quirurgico' THEN " . $movimientos[$i] . " ELSE 0 END) AS Pabellon,
                SUM(CASE WHEN servicio = 'Neuro Trauma' THEN " . $movimientos[$i] . " ELSE 0 END) AS Neuro_Trauma,
                SUM(CASE WHEN servicio = 'Ginecologia' THEN " . $movimientos[$i] . " ELSE 0 END) AS Ginecologia,
                SUM(CASE WHEN servicio = 'Neonatologia' THEN " . $movimientos[$i] . " ELSE 0 END) AS Neonatologia,
                SUM(CASE WHEN servicio = 'Pediatria' THEN " . $movimientos[$i] . " ELSE 0 END) AS Pediatria,
                SUM(CASE WHEN servicio = 'Onco Pediatria' THEN " . $movimientos[$i] . " ELSE 0 END) AS Onco_Pediatria,
                SUM(CASE WHEN servicio = 'UCIM' THEN " . $movimientos[$i] . " ELSE 0 END) AS UCIM,
                SUM(CASE WHEN servicio = 'UTI PEDIATRIA' THEN " . $movimientos[$i] . " ELSE 0 END) AS Uti_Pediatria,
                SUM(CASE WHEN servicio = 'UTI ADULTOS' THEN " . $movimientos[$i] . " ELSE 0 END) AS Uti_Adultos,
                SUM(" . $movimientos[$i] . ") AS Total 
            FROM censo WHERE fecha >= :fechaInicio AND fecha <= :fechaFin
            GROUP BY PERIODO
            ORDER BY PERIODO asc;";

            $stmt = $this->pdo->prepare($queryCenso);
            $stmt->execute([
                ':fechaInicio' => $fechaInicio,
                ':fechaFin' => $fechaFin
            ]);

            $censo[ $movimientos[$i] ] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        
        if (!$censo) {
            return null;
        }

        return $censo;
    }
}




?>