<?php
require_once("../datos/Compensaciones/DCompensaciones.php");

class NCompensaciones {

    private $DCompensaciones;

    public function __construct() {
        $this->DCompensaciones = new DCompensaciones();
    }

    // =====================================================
    // PERSONAL — ABM
    // =====================================================

    public function getAllPersonal() {
        try {
            $personal = $this->DCompensaciones->getAllPersonal();
            return $this->respuestaExito(200, 'Personal obtenido', $personal);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener personal: ' . $e->getMessage());
        }
    }

    public function getPersonalActivo() {
        try {
            $personal = $this->DCompensaciones->getPersonalActivo();
            return $this->respuestaExito(200, 'Personal activo obtenido', $personal);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener personal: ' . $e->getMessage());
        }
    }

    public function crearPersonal($data) {
        try {
            if (empty($data['nombres']) || empty($data['apellidos'])) {
                return $this->respuestaError(400, 'Nombres y apellidos son requeridos');
            }

            $id = $this->DCompensaciones->insertarPersonal($data);
            return $this->respuestaExito(201, 'Funcionario creado correctamente', ['id' => $id]);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al crear funcionario: ' . $e->getMessage());
        }
    }

    public function actualizarPersonal($data) {
        try {
            if (empty($data['id'])) {
                return $this->respuestaError(400, 'El ID del funcionario es requerido');
            }
            if (empty($data['nombres']) || empty($data['apellidos'])) {
                return $this->respuestaError(400, 'Nombres y apellidos son requeridos');
            }
            if (!isset($data['activo'])) {
                return $this->respuestaError(400, 'El campo activo es requerido');
            }

            $filas = $this->DCompensaciones->actualizarPersonal($data);

            if ($filas === 0) {
                return $this->respuestaError(404, 'Funcionario no encontrado');
            }

            return $this->respuestaExito(200, 'Funcionario actualizado correctamente');
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al actualizar funcionario: ' . $e->getMessage());
        }
    }

    public function eliminarPersonal($data) {
        try {
            if (empty($data['id'])) {
                return $this->respuestaError(400, 'El ID del funcionario es requerido');
            }

            $filas = $this->DCompensaciones->eliminarPersonal($data['id']);

            if ($filas === 0) {
                return $this->respuestaError(404, 'Funcionario no encontrado');
            }

            return $this->respuestaExito(200, 'Funcionario eliminado correctamente');
        } catch (Exception $e) {
            // Mensaje de negocio (ej: tiene compensaciones) se reenvía tal cual
            return $this->respuestaError(409, $e->getMessage());
        }
    }

    // =====================================================
    // COMPENSACIONES — CRUD
    // =====================================================

    /**
     * Upsert: crea o actualiza el registro para persona+mes+año
     */
    public function guardarCompensacion($data) {
        try {
            // Validaciones
            if (empty($data['personal_id'])) {
                return $this->respuestaError(400, 'El funcionario es requerido');
            }
            if (empty($data['anho']) || empty($data['mes'])) {
                return $this->respuestaError(400, 'Año y mes son requeridos');
            }
            if (!isset($data['horas_programadas']) || !isset($data['horas_pagadas']) || !isset($data['permisos_horas'])) {
                return $this->respuestaError(400, 'Las horas programadas, pagadas y permisos son requeridas');
            }
            if ((float)$data['horas_programadas'] < 0 || (float)$data['horas_pagadas'] < 0 || (float)$data['permisos_horas'] < 0) {
                return $this->respuestaError(400, 'Los valores de horas no pueden ser negativos');
            }
            if (!$this->DCompensaciones->personalExiste($data['personal_id'])) {
                return $this->respuestaError(404, 'El funcionario seleccionado no existe o está inactivo');
            }

            $existe = $this->DCompensaciones->registroExiste($data['personal_id'], $data['anho'], $data['mes']);

            if ($existe) {
                $this->DCompensaciones->actualizarCompensacion($data);
                $mensaje = 'Registro actualizado correctamente';
            } else {
                $this->DCompensaciones->insertarCompensacion($data);
                $mensaje = 'Registro creado correctamente';
            }

            // Retornar el registro guardado con el saldo calculado
            $registro = $this->DCompensaciones->getRegistro($data['personal_id'], $data['anho'], $data['mes']);
            return $this->respuestaExito(200, $mensaje, $registro);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al guardar compensación: ' . $e->getMessage());
        }
    }

    public function getRegistro($data) {
        try {
            if (empty($data['personal_id']) || empty($data['anho']) || empty($data['mes'])) {
                return $this->respuestaError(400, 'personal_id, anho y mes son requeridos');
            }

            $registro = $this->DCompensaciones->getRegistro($data['personal_id'], $data['anho'], $data['mes']);

            if (!$registro) {
                return $this->respuestaExito(200, 'Sin registro para ese período', null);
            }

            return $this->respuestaExito(200, 'Registro obtenido', $registro);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener registro: ' . $e->getMessage());
        }
    }

    public function eliminarCompensacion($data) {
        try {
            if (empty($data['personal_id']) || empty($data['anho']) || empty($data['mes'])) {
                return $this->respuestaError(400, 'personal_id, anho y mes son requeridos');
            }

            $filas = $this->DCompensaciones->eliminarCompensacion($data['personal_id'], $data['anho'], $data['mes']);

            if ($filas === 0) {
                return $this->respuestaError(404, 'Registro no encontrado');
            }

            return $this->respuestaExito(200, 'Registro eliminado correctamente');
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al eliminar registro: ' . $e->getMessage());
        }
    }

    // =====================================================
    // CONSULTAS
    // =====================================================

    public function getRegistrosPorPersonaAnho($data) {
        try {
            if (empty($data['personal_id']) || empty($data['anho'])) {
                return $this->respuestaError(400, 'personal_id y anho son requeridos');
            }

            $registros = $this->DCompensaciones->getRegistrosPorPersonaAnho($data['personal_id'], $data['anho']);
            return $this->respuestaExito(200, 'Registros obtenidos', $registros);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener registros: ' . $e->getMessage());
        }
    }

    public function getResumenAnual($data) {
        try {
            $anho      = !empty($data['anho']) ? (int)$data['anho'] : null;
            $registros = $this->DCompensaciones->getResumenAnual($anho);
            return $this->respuestaExito(200, 'Resumen anual obtenido', $registros);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener resumen: ' . $e->getMessage());
        }
    }

    public function getResumenMultiAnho($data) {
        try {
            $anhos = !empty($data['anhos']) && is_array($data['anhos']) ? $data['anhos'] : [];
            $registros = $this->DCompensaciones->getResumenMultiAnho($anhos);
            return $this->respuestaExito(200, 'Resumen multi-año obtenido', $registros);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener resumen: ' . $e->getMessage());
        }
    }

    public function getAnhosDisponibles() {
        try {
            $anhos = $this->DCompensaciones->getAnhosDisponibles();
            return $this->respuestaExito(200, 'Años disponibles obtenidos', $anhos);
        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener años: ' . $e->getMessage());
        }
    }

    // =====================================================
    // RESPUESTAS
    // =====================================================

    private function respuestaExito($codigo, $mensaje, $data = null) {
        http_response_code($codigo);
        echo json_encode([
            'status'  => 'success',
            'message' => $mensaje,
            'data'    => $data
        ]);
    }

    private function respuestaError($codigo, $mensaje) {
        http_response_code($codigo);
        echo json_encode([
            'status'  => 'failed',
            'message' => $mensaje
        ]);
    }
}
?>