<?php 
require_once("../datos/Formulario/DFormulario.php");
class NFormulario {

    private $DFormulario;

    public function __construct() {
        $this->DFormulario = new DFormulario();
    }

    /**
     * Verificar y guardar censo con camas prestadas
     * 
     * @param array $data Datos en formato: { censo: {}, camasPrestadas: [] }
     * @return array Respuesta con status, message y data
     */
    public function verificarYGuardar($data) {
        
        try {
            // Validar que vengan los datos mínimos requeridos
            if (!isset($data['censo']) || !is_array($data['censo'])) {
                return $this->respuestaError(400, 'Estructura de datos inválida: falta objeto "censo"');
            }

            $censo = $data['censo'];
            
            // Validar campos requeridos del censo
            if (empty($censo['fecha']) || empty($censo['servicio'])) {
                return $this->respuestaError(400, 'Datos incompletos: fecha y servicio son requeridos');
            }

            // Iniciar transacción para garantizar atomicidad
            $this->DFormulario->iniciarTransaccion();

            try {
                $filasAfectadasCenso = $this->DFormulario->verificarYGuardar($censo);
                
                $filasAfectadasCamas = 0;
                if (isset($data['camasPrestadas']) && is_array($data['camasPrestadas']) && count($data['camasPrestadas']) > 0) {
                    
                    $camasValidas = $this->validarCamasPrestadas($data['camasPrestadas']);
                    
                    if (count($camasValidas) > 0) {
                        $camasConRelacion = $this->agregarRelacionCenso($camasValidas, $censo['fecha'], $censo['servicio']);
                        
                        $this->DFormulario->eliminarCamasPrestadas($censo['fecha'], $censo['servicio']);
                        
                        $filasAfectadasCamas = $this->DFormulario->guardarCamasPrestadas($camasConRelacion);
                    }
                }

                $this->DFormulario->confirmarTransaccion();

                
                $totalFilas = $filasAfectadasCenso + $filasAfectadasCamas;
                $mensaje = sprintf(
                    "Operación exitosa: %d registro(s) de censo, %d cama(s) prestada(s)",
                    $filasAfectadasCenso,
                    $filasAfectadasCamas
                );
                
                $this->respuestaExito(200, $mensaje, [
                    'censo' => $filasAfectadasCenso,
                    'camas_prestadas' => $filasAfectadasCamas,
                    'total' => $totalFilas
                ]);
                

            } catch (Exception $e) {
                // Rollback en caso de error
                $this->DFormulario->revertirTransaccion();
                throw $e;
            }

        } catch (Exception $e) {
            $this->respuestaError(500, 'Error al procesar datos: ' . $e->getMessage());
        }
    }

    /**
     * Validar que las camas prestadas tengan la estructura correcta
     * 
     * @param array $camasPrestadas Array de objetos con estructura: 
     *                              { especialidad, cantidad, tipo_ingreso }
     * @return array Array filtrado con solo camas válidas
     */
    private function validarCamasPrestadas($camasPrestadas) {
        $camasValidas = [];

        foreach ($camasPrestadas as $index => $cama) {
            // Verificar que sea un array/objeto
            if (!is_array($cama)) {
                continue;
            }

            // Verificar campos requeridos
            if (empty($cama['especialidad']) || 
                empty($cama['tipo_ingreso']) || 
                !isset($cama['cantidad'])) {
                continue;
            }

            // Validar cantidad
            $cantidad = (int)$cama['cantidad'];
            if ($cantidad <= 0) {
                continue;
            }

            // Validar tipo_ingreso
            $tipo_ingreso = strtoupper(trim($cama['tipo_ingreso']));
            if (!in_array($tipo_ingreso, ['DIRECTO', 'TRASLADO'])) {
                continue;
            }

            // Agregar a las camas válidas
            $camasValidas[] = [
                'especialidad' => trim($cama['especialidad']),
                'cantidad' => $cantidad,
                'tipo_ingreso' => $tipo_ingreso
            ];
        }

        return $camasValidas;
    }

    /**
     * Agregar fecha y servicio a cada cama prestada
     * 
     * @param array $camas Array de camas validadas
     * @param string $fecha Fecha del censo
     * @param string $servicio Servicio del censo
     * @return array Camas con relación al censo
     */
    private function agregarRelacionCenso($camas, $fecha, $servicio) {
        return array_map(function($cama) use ($fecha, $servicio) {
            return array_merge($cama, [
                'fecha' => $fecha,
                'servicio' => $servicio
            ]);
        }, $camas);
    }

    /**
     * Obtener censo completo con camas prestadas
     * 
     * @param string $fecha
     * @param string $servicio
     * @return array Respuesta con status y data
     */
    public function obtenerCenso($fecha, $servicio) {
        try {
            if (empty($fecha) || empty($servicio)) {
                return $this->respuestaError(400, 'Parámetros faltantes: fecha y servicio son requeridos');
            }

            $censoCompleto = $this->DFormulario->obtenerCensoCompleto($fecha, $servicio);

            if ($censoCompleto) {
                return $this->respuestaExito(200, 'Censo encontrado', $censoCompleto);
            } else {
                return $this->respuestaError(404, 'Censo no encontrado');
            }

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener censo: ' . $e->getMessage());
        }
    }

    // =====================================================
    // MÉTODOS AUXILIARES PARA RESPUESTAS
    // =====================================================

    /**
     * Crear respuesta de éxito
     * 
     * @param int $codigo Código HTTP
     * @param string $mensaje Mensaje descriptivo
     * @param mixed $data Datos a retornar
     * @return array
     */
    private function respuestaExito($codigo, $mensaje, $data = null) {
        http_response_code($codigo);
        echo json_encode([
            'status' => 'success',
            'message' => $mensaje,
            'data' => $data
        ]);
    }

    /**
     * Crear respuesta de error
     * 
     * @param int $codigo Código HTTP
     * @param string $mensaje Mensaje de error
     * @return array
     */
    private function respuestaError($codigo, $mensaje) {
        http_response_code($codigo);
        echo json_encode( [
            'status' => 'failed',
            'message' => $mensaje
        ]);
    }

    public function getTotalAyer($data){
        try {
            if (!isset($data['fecha']) || !isset($data['servicio'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fecha y servicio son requeridos');
            }

            $total = $this->DFormulario->getTotalAyer($data['fecha'], $data['servicio']);

            return $this->respuestaExito(200, 'Total obtenido', $total);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener total: ' . $e->getMessage());
        }
    }
}
?>