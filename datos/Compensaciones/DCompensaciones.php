<?php

namespace Admision\Datos\Compensaciones;

use Admision\Config\PgsqlConnection;
use PDO;
use Exception;

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
                         COALESCE(SUM(c.horas_programadas), 0)                   AS total_programadas,
                         COALESCE(SUM(c.horas_pagadas), 0)                       AS total_pagadas,
                         COALESCE(SUM(c.horas_programadas - c.horas_pagadas), 0) AS horas_impagas,
                         COALESCE(SUM(c.permisos_horas), 0)                      AS permisos_tomados,
                         COALESCE(SUM(c.saldo_horas), 0) - COALESCE(d.total_descontado, 0) AS saldo_compensacion
                  FROM personal p
                  LEFT JOIN compensaciones c ON c.personal_id = p.id
                  LEFT JOIN (
                      SELECT personal_id, anho, SUM(horas_descontadas) AS total_descontado
                      FROM compensaciones_descuentos
                      GROUP BY personal_id, anho
                  ) d ON d.personal_id = p.id AND d.anho = c.anho
                  {$whereAnho}
                  GROUP BY p.id, p.nombres, p.apellidos, c.anho, d.total_descontado
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

    // =====================================================
    // DESCUENTOS DE HORAS PENDIENTES
    // =====================================================

    /**
     * Saldo pendiente por gestión para una persona, neto de descuentos ya aplicados.
     * Ordenado ascendente por año (la gestión más antigua primero).
     */
    public function getSaldoPendientePorGestion($personalId) {
        $query = "SELECT c.anho,
                         SUM(c.saldo_horas)                          AS saldo_bruto,
                         COALESCE(d.total_descontado, 0)             AS horas_descontadas,
                         SUM(c.saldo_horas) - COALESCE(d.total_descontado, 0) AS saldo_neto
                  FROM compensaciones c
                  LEFT JOIN (
                      SELECT anho, SUM(horas_descontadas) AS total_descontado
                      FROM compensaciones_descuentos
                      WHERE personal_id = :personal_id
                      GROUP BY anho
                  ) d ON d.anho = c.anho
                  WHERE c.personal_id = :personal_id
                  GROUP BY c.anho, d.total_descontado
                  ORDER BY c.anho ASC";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([':personal_id' => (int)$personalId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Saldo neto pendiente de una persona en una gestión puntual (para validar un descuento).
     */
    public function getSaldoNetoGestion($personalId, $anho) {
        $query = "SELECT
                      COALESCE((SELECT SUM(saldo_horas) FROM compensaciones
                                WHERE personal_id = :personal_id AND anho = :anho), 0)
                      -
                      COALESCE((SELECT SUM(horas_descontadas) FROM compensaciones_descuentos
                                WHERE personal_id = :personal_id2 AND anho = :anho2), 0)
                      AS saldo_neto";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id'  => (int)$personalId,
            ':anho'         => (int)$anho,
            ':personal_id2' => (int)$personalId,
            ':anho2'        => (int)$anho
        ]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? (float)$row['saldo_neto'] : 0.0;
    }

    public function insertarDescuento($data) {
        $query = "INSERT INTO compensaciones_descuentos (personal_id, anho, horas_descontadas, fecha_descuento, motivo)
                  VALUES (:personal_id, :anho, :horas_descontadas, :fecha_descuento, :motivo)
                  RETURNING id";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([
            ':personal_id'       => (int)$data['personal_id'],
            ':anho'              => (int)$data['anho'],
            ':horas_descontadas' => (float)$data['horas_descontadas'],
            ':fecha_descuento'   => $data['fecha_descuento'] ?? date('Y-m-d'),
            ':motivo'            => $data['motivo'] ?? null
        ]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return (int)$row['id'];
    }

    public function getDescuentosPorPersona($personalId) {
        $query = "SELECT id, personal_id, anho, horas_descontadas, fecha_descuento, motivo, creado_en
                  FROM compensaciones_descuentos
                  WHERE personal_id = :personal_id
                  ORDER BY anho ASC, fecha_descuento ASC";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute([':personal_id' => (int)$personalId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function eliminarDescuento($id) {
        $query = "DELETE FROM compensaciones_descuentos WHERE id = :id";
        $stmt  = $this->pdo->prepare($query);
        $stmt->execute([':id' => (int)$id]);
        return $stmt->rowCount();
    }
}
?>