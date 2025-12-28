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
    
    public function __construct($conexion) {
        $this->conexion = $conexion;
    }

    // =====================================================
    // TRANSACCIONES
    // =====================================================

    public function iniciarTransaccion() {
        pg_query($this->conexion, "BEGIN");
    }

    public function confirmarTransaccion() {
        pg_query($this->conexion, "COMMIT");
    }

    public function revertirTransaccion() {
        pg_query($this->conexion, "ROLLBACK");
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
                  WHERE fecha = $1 AND servicio = $2";
        
        $result = pg_query_params($this->conexion, $query, [$fecha, $servicio]);
        
        if (!$result) {
            throw new Exception("Error al verificar existencia: " . pg_last_error($this->conexion));
        }

        $row = pg_fetch_assoc($result);
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
                    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12
                  )";

        $params = [
            $data['fecha'],
            $data['servicio'],
            (int)$data['ingreso'],
            (int)$data['ingreso_traslado'],
            (int)$data['egreso'],
            (int)$data['egreso_traslado'],
            (int)$data['obito'],
            (int)$data['aislamiento'],
            (int)$data['bloqueada'],
            (int)$data['total'],
            (int)$data['libre'],
            (int)$data['dotacion']
        ];

        $result = pg_query_params($this->conexion, $query, $params);

        if (!$result) {
            throw new Exception("Error al insertar censo: " . pg_last_error($this->conexion));
        }

        return pg_affected_rows($result);
    }

    /**
     * Actualizar censo existente
     * 
     * @param array $data
     * @return int Filas actualizadas
     */
    private function actualizarCenso($data) {
        $query = "UPDATE censo SET 
                    ingreso = $3,
                    ingreso_traslado = $4,
                    egreso = $5,
                    egreso_traslado = $6,
                    obito = $7,
                    aislamiento = $8,
                    bloqueada = $9,
                    total = $10,
                    libre = $11,
                    dotacion = $12
                  WHERE fecha = $1 AND servicio = $2";

        $params = [
            $data['fecha'],
            $data['servicio'],
            (int)$data['ingreso'],
            (int)$data['ingreso_traslado'],
            (int)$data['egreso'],
            (int)$data['egreso_traslado'],
            (int)$data['obito'],
            (int)$data['aislamiento'],
            (int)$data['bloqueada'],
            (int)$data['total'],
            (int)$data['libre'],
            (int)$data['dotacion']
        ];

        $result = pg_query_params($this->conexion, $query, $params);

        if (!$result) {
            throw new Exception("Error al actualizar censo: " . pg_last_error($this->conexion));
        }

        return pg_affected_rows($result);
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

        foreach ($camasPrestadas as $cama) {
            $query = "INSERT INTO camas_prestadas (
                        fecha, servicio, especialidad, cantidad, tipo_ingreso
                      ) VALUES (
                        $1, $2, $3, $4, $5
                      )
                      ON CONFLICT (fecha, servicio, especialidad, tipo_ingreso) 
                      DO UPDATE SET cantidad = EXCLUDED.cantidad";

            $params = [
                $cama['fecha'],
                $cama['servicio'],
                $cama['especialidad'],
                (int)$cama['cantidad'],
                $cama['tipo_ingreso']
            ];

            $result = pg_query_params($this->conexion, $query, $params);

            if (!$result) {
                throw new Exception("Error al guardar cama prestada: " . pg_last_error($this->conexion));
            }

            $totalInsertadas += pg_affected_rows($result);
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
                  WHERE fecha = $1 AND servicio = $2";

        $result = pg_query_params($this->conexion, $query, [$fecha, $servicio]);

        if (!$result) {
            throw new Exception("Error al eliminar camas prestadas: " . pg_last_error($this->conexion));
        }

        return pg_affected_rows($result);
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
                  WHERE fecha = $1 AND servicio = $2
                  ORDER BY especialidad, tipo_ingreso";

        $result = pg_query_params($this->conexion, $query, [$fecha, $servicio]);

        if (!$result) {
            throw new Exception("Error al obtener camas prestadas: " . pg_last_error($this->conexion));
        }

        $camas = [];
        while ($row = pg_fetch_assoc($result)) {
            $camas[] = $row;
        }

        return $camas;
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
                  WHERE fecha = $1 AND servicio = $2";

        $result = pg_query_params($this->conexion, $query, [$fecha, $servicio]);

        if (!$result) {
            throw new Exception("Error al contar camas prestadas: " . pg_last_error($this->conexion));
        }

        $row = pg_fetch_assoc($result);
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
        $queryCenso = "SELECT * FROM censo WHERE fecha = $1 AND servicio = $2";
        $resultCenso = pg_query_params($this->conexion, $queryCenso, [$fecha, $servicio]);

        if (!$resultCenso || pg_num_rows($resultCenso) === 0) {
            return null;
        }

        $censo = pg_fetch_assoc($resultCenso);

        // Obtener camas prestadas
        $censo['camas_prestadas'] = $this->obtenerCamasPrestadas($fecha, $servicio);

        return $censo;
    }
}

?>