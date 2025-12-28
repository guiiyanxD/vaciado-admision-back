<?php 
require_once("../datos/Formulario/DFormulario.php");
    class NFormulario {

        private $DFormulario;
    
        public function __construct($DFormulario) {
            $this->DFormulario = $DFormulario;
        }

        /**
         * Verificar y guardar censo con camas prestadas
         * 
         * @param array $data Datos en formato: { censo: {}, camasPrestadas: [] }
         * @return void (envía respuesta JSON)
         */
        public function verificarYGuardar($data) {
            try {
                // Validar que vengan los datos mínimos requeridos
                if (!isset($data['censo']) || !is_array($data['censo'])) {
                    $this->enviarError(400, 'Estructura de datos inválida: falta objeto "censo"');
                    return;
                }

                $censo = $data['censo'];
                
                // Validar campos requeridos del censo
                if (empty($censo['fecha']) || empty($censo['servicio'])) {
                    $this->enviarError(400, 'Datos incompletos: fecha y servicio son requeridos');
                    return;
                }

                // Iniciar transacción para garantizar atomicidad
                $this->DFormulario->iniciarTransaccion();

                try {
                    // 1. Guardar o actualizar el censo principal
                    $filasAfectadasCenso = $this->DFormulario->verificarYGuardar($censo);
                    
                    // 2. Procesar camas prestadas si existen
                    $filasAfectadasCamas = 0;
                    if (isset($data['camasPrestadas']) && is_array($data['camasPrestadas']) && count($data['camasPrestadas']) > 0) {
                        
                        // Validar estructura de camas prestadas
                        $camasValidas = $this->validarCamasPrestadas($data['camasPrestadas']);
                        
                        if (count($camasValidas) > 0) {
                            // Agregar fecha y servicio a cada cama prestada
                            $camasConRelacion = $this->agregarRelacionCenso($camasValidas, $censo['fecha'], $censo['servicio']);
                            
                            // Primero eliminar camas prestadas anteriores de esta fecha+servicio
                            $this->DFormulario->eliminarCamasPrestadas($censo['fecha'], $censo['servicio']);
                            
                            // Luego insertar las nuevas
                            $filasAfectadasCamas = $this->DFormulario->guardarCamasPrestadas($camasConRelacion);
                        }
                    }

                    // Commit de la transacción
                    $this->DFormulario->confirmarTransaccion();

                    // Respuesta exitosa
                    $totalFilas = $filasAfectadasCenso + $filasAfectadasCamas;
                    $mensaje = sprintf(
                        "Operación exitosa: %d registro(s) de censo, %d cama(s) prestada(s)",
                        $filasAfectadasCenso,
                        $filasAfectadasCamas
                    );

                    $this->enviarExito(200, $mensaje, [
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
                $this->enviarError(500, 'Error al procesar datos: ' . $e->getMessage());
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
         * Enviar respuesta de éxito
         */
        private function enviarExito($codigo, $mensaje, $data = null) {
            http_response_code($codigo);
            echo json_encode([
                'status' => 'success',
                'message' => $mensaje,
                'data' => $data
            ], JSON_UNESCAPED_UNICODE);
            exit;
        }

        /**
         * Enviar respuesta de error
         */
        private function enviarError($codigo, $mensaje) {
            http_response_code($codigo);
            echo json_encode([
                'status' => 'failed',
                'message' => $mensaje
            ], JSON_UNESCAPED_UNICODE);
            exit;
        }

        public function getServicios(){
            $servicios = $this->DFormulario->getServicios();
            http_response_code(200);
            echo json_encode([
                'status' => 'success',
                'data' => $servicios
            ]);
            exit;
        }
    }
?>