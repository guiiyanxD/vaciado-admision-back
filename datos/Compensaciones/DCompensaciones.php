<?php
require_once("../config/connection.php");
require_once("../config/Pgsql.php");

class DCompensaciones {

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
    // PERSONAL
    // =====================================================

    public function getAllPersonal() {
        $query = "SELECT id, nombres, apellidos, activo, creado_en
                  FROM personal
                  ORDER BY apellidos, nombres";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPersonalActivo() {
        $query = "SELECT id, nombres, apellidos
                  FROM personal
                  WHERE activo = TRUE
                  ORDER BY apellidos, nombres";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getPersonalById($id) {
        $query = "SELECT id, nombres, apellidos, activo, creado_en
                  FROM personal
                  WHERE id = :id";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([':id' => (int)$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function insertarPersonal($data) {
        $query = "INSERT INTO personal (nombres, apellidos, activo)
                  VALUES (:nombres, :apellidos, :activo)
                  RETURNING id";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':nombres'   => trim($data['nombres']),
            ':apellidos' => trim($data['apellidos']),
            ':activo'    => isset($data['activo']) ? (bool)$data['activo'] : true
        ]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['id'];
    }

    public function actualizarPersonal($data) {
        $query = "UPDATE personal
                  SET nombres   = :nombres,
                      apellidos = :apellidos,
                      activo    = :activo
                  WHERE id = :id";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':id'        => (int)$data['id'],
            ':nombres'   => trim($data['nombres']),
            ':apellidos' => trim($data['apellidos']),
            ':activo'    => (bool)$data['activo']
        ]);
        return $stmt->rowCount();
    }

    public function eliminarPersonal($id) {
        // Verificar que no tenga registros de compensaciones antes de eliminar
        $queryCheck = "SELECT COUNT(*) as total FROM compensaciones WHERE personal_id = :id";
        $stmt = $this->pdo->prepare($queryCheck);
        $stmt->execute([':id' => (int)$id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if ((int)$row['total'] > 0) {
            throw new Exception("No se puede eliminar: el funcionario tiene {$row['total']} registro(s) de compensaciones. Desactívelo en su lugar.");
        }

        $query = "DELETE FROM personal WHERE id = :id";
        $stmt  = $this->pdo->prepare($query);
        $stmt->execute([':id' => (int)$id]);
        return $stmt->rowCount();
    }

    public function personalExiste($id) {
        $query = "SELECT COUNT(*) as total FROM personal WHERE id = :id AND activo = TRUE";
        $stmt  = $this->pdo->prepare($query);
        $stmt->execute([':id' => (int)$id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'] > 0;
    }

    // =====================================================
    // COMPENSACIONES
    // =====================================================

    public function getRegistro($personalId, $anho, $mes) {
        $query = "SELECT c.id, c.personal_id, c.anho, c.mes,
                         c.horas_programadas, c.horas_pagadas, c.permisos_horas, c.saldo_horas,
                         p.nombres, p.apellidos
                  FROM compensaciones c
                  JOIN personal p ON p.id = c.personal_id
                  WHERE c.personal_id = :personal_id
                    AND c.anho = :anho
                    AND c.mes  = :mes";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id' => (int)$personalId,
            ':anho'        => (int)$anho,
            ':mes'         => (int)$mes
        ]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function registroExiste($personalId, $anho, $mes) {
        $query = "SELECT COUNT(*) as total FROM compensaciones
                  WHERE personal_id = :personal_id AND anho = :anho AND mes = :mes";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id' => (int)$personalId,
            ':anho'        => (int)$anho,
            ':mes'         => (int)$mes
        ]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['total'] > 0;
    }

    public function insertarCompensacion($data) {
        $query = "INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
                  VALUES (:personal_id, :anho, :mes, :horas_programadas, :horas_pagadas, :permisos_horas)";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id'      => (int)$data['personal_id'],
            ':anho'             => (int)$data['anho'],
            ':mes'              => (int)$data['mes'],
            ':horas_programadas'=> (float)$data['horas_programadas'],
            ':horas_pagadas'    => (float)$data['horas_pagadas'],
            ':permisos_horas'   => (float)$data['permisos_horas']
        ]);

        if ($stmt->rowCount() === 0) {
            throw new Exception("Error al insertar registro de compensación");
        }
        return $stmt->rowCount();
    }

    public function actualizarCompensacion($data) {
        $query = "UPDATE compensaciones
                  SET horas_programadas = :horas_programadas,
                      horas_pagadas     = :horas_pagadas,
                      permisos_horas    = :permisos_horas
                  WHERE personal_id = :personal_id
                    AND anho        = :anho
                    AND mes         = :mes";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id'      => (int)$data['personal_id'],
            ':anho'             => (int)$data['anho'],
            ':mes'              => (int)$data['mes'],
            ':horas_programadas'=> (float)$data['horas_programadas'],
            ':horas_pagadas'    => (float)$data['horas_pagadas'],
            ':permisos_horas'   => (float)$data['permisos_horas']
        ]);

        if ($stmt->rowCount() === 0) {
            throw new Exception("Error al actualizar registro de compensación");
        }
        return $stmt->rowCount();
    }

    public function eliminarCompensacion($personalId, $anho, $mes) {
        $query = "DELETE FROM compensaciones
                  WHERE personal_id = :personal_id AND anho = :anho AND mes = :mes";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id' => (int)$personalId,
            ':anho'        => (int)$anho,
            ':mes'         => (int)$mes
        ]);
        return $stmt->rowCount();
    }

    // =====================================================
    // CONSULTAS
    // =====================================================

    /**
     * Todos los registros de un funcionario en un año, ordenados por mes
     */
    public function getRegistrosPorPersonaAnho($personalId, $anho) {
        $query = "SELECT c.id, c.mes, c.horas_programadas, c.horas_pagadas,
                         c.permisos_horas, c.saldo_horas,
                         p.nombres, p.apellidos
                  FROM compensaciones c
                  JOIN personal p ON p.id = c.personal_id
                  WHERE c.personal_id = :personal_id AND c.anho = :anho
                  ORDER BY c.mes";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id' => (int)$personalId,
            ':anho'        => (int)$anho
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Resumen acumulado por persona y año (equivalente a la hoja RECUENTO)
     * Retorna: personal_id, nombres, apellidos, anho,
     *          total_programadas, total_pagadas, total_permisos, saldo_total
     */
    public function getResumenAnual($anho = null) {
        $whereAnho = $anho ? "WHERE c.anho = :anho" : "";
        $params    = $anho ? [':anho' => (int)$anho] : [];

        $query = "SELECT p.id AS personal_id,
                         p.nombres,
                         p.apellidos,
                         c.anho,
                         SUM(c.horas_programadas) AS total_programadas,
                         SUM(c.horas_pagadas)     AS total_pagadas,
                         SUM(c.permisos_horas)    AS total_permisos,
                         SUM(c.saldo_horas)       AS saldo_total
                  FROM personal p
                  LEFT JOIN compensaciones c ON c.personal_id = p.id
                  {$whereAnho}
                  GROUP BY p.id, p.nombres, p.apellidos, c.anho
                  ORDER BY p.apellidos, p.nombres, c.anho";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Resumen multi-año (todas las gestiones), agrupado por persona
     * Igual a la hoja RECUENTO completa
     */
    public function getResumenMultiAnho($anhos = []) {
        if (empty($anhos)) {
            $whereAnho = "";
            $params    = [];
        } else {
            $placeholders = implode(',', array_map(fn($i) => ":anho{$i}", array_keys($anhos)));
            $whereAnho    = "WHERE c.anho IN ({$placeholders})";
            $params       = [];
            foreach ($anhos as $i => $v) {
                $params[":anho{$i}"] = (int)$v;
            }
        }

        $query = "SELECT p.id AS personal_id,
                         p.nombres,
                         p.apellidos,
                         c.anho,
                         COALESCE(SUM(c.horas_programadas - c.horas_pagadas), 0) AS horas_impagas,
                         COALESCE(SUM(c.permisos_horas), 0)                      AS permisos_tomados,
                         COALESCE(SUM(c.saldo_horas), 0)                         AS saldo_compensacion
                  FROM personal p
                  LEFT JOIN compensaciones c ON c.personal_id = p.id
                  {$whereAnho}
                  GROUP BY p.id, p.nombres, p.apellidos, c.anho
                  ORDER BY p.apellidos, p.nombres, c.anho NULLS LAST";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Años disponibles en la tabla de compensaciones
     */
    public function getAnhosDisponibles() {
        $query = "SELECT DISTINCT anho FROM compensaciones ORDER BY anho DESC";
        $stmt  = $this->pdo->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_COLUMN);
    }
}
?>