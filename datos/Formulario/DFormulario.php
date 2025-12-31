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
    // CENSO PRINCIPAL
    // =====================================================

    /**
     * Verificar si existe un censo y guardarlo/actualizarlo
     * 
     * @param array $data Datos del censo
     * @return int Número de filas afectadas
     */
    public function verificarYGuardar($data) {
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
     * Esto permite reemplazar completamente los registros en cada guardado
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
    public function obtenerCensoCompleto($fecha, $servicio) {
        // Obtener censo principal
        $queryCenso = "SELECT * FROM censo WHERE fecha = :fecha AND servicio = :servicio";
        $stmt = $this->pdo->prepare($queryCenso);
        $stmt->execute([
            ':fecha' => $fecha,
            ':servicio' => $servicio
        ]);

        $censo = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$censo) {
            return null;
        }

        // Obtener camas prestadas
        $censo['camas_prestadas'] = $this->obtenerCamasPrestadas($fecha, $servicio);

        return $censo;
    }

}



?>