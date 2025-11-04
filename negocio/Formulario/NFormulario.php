<?php 
require_once("../datos/Formulario/DFormulario.php");
    class NFormulario {

        private $DFormulario;
        
        public function __construct(){
            $this->DFormulario = new DFormulario();
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

        public function getEspecialidades(){
            $especialidades = $this->DFormulario->getEspecialidades();
            http_response_code(200);
            echo json_encode([
                'status' => 'success',
                'data' => $especialidades
            ]);
            exit;
        }

        public function guardarDatos($data) {
            $resultado = $this->DFormulario->guardarDatos($data);
            http_response_code(200);
            echo json_encode([
                'status' => 'success',
                'data' => $resultado
            ]);
        }

        public function getTotalAyer($data) {
            
            $totalAyer = $this->DFormulario->getTotalAyer($data);
            return $totalAyer;
        }
        /**
         * Verifica si existen datos para la fecha y servicio dados. Si existen, actualiza los datos; si no, inserta una nueva fila.
         * Retorna el número de filas insertadas o actualizadas.
         * @param array $data Datos del formulario que incluyen 'fecha', 'servicio', 'ingreso', etc.
         * @return int Número de filas afectadas (insertadas o actualizadas).
         * @throws Exception Si ocurre un error al verificar o guardar los datos.
         * success: 1 fila insertada.
         * failed: 0 filas insertadas (ya existían los datos).
         */
        public function verificarYGuardar($data) {
            if ($data['fecha'] !== null || $data['servicio'] !== null) {
               $camasPrestadas = $this->separarCamasPrestadasValidas($data);
               
                if(!empty($camasPrestadas)){
                   $response = $this->DFormulario->guardarCamasPrestadas($camasPrestadas);
                }
                
                $filasInsertadas = $this->DFormulario->verificarYGuardar($data);
                if($filasInsertadas > 0){
                    $message = $filasInsertadas . " filas insertadas o actualizadas.";
                    http_response_code(200);
                    echo json_encode([
                        'status' => 'success',
                        'data' => ($filasInsertadas),
                        'message' => $message
                    ]);
                    exit;
                } else {
                    $message = "No se realizaron inserciones ni actualizaciones.";
                    http_response_code(200);
                    echo json_encode([  
                        'status' => 'failed',
                        'data' => ($filasInsertadas),
                        'message' => $message
                    ]);
                    exit;
                }
            }else{
                http_response_code(400);
                echo json_encode(['error' => 'Datos incompletos']);
                exit;
            }
        }

        public function separarCamasPrestadasValidas($data){
            $rowData = [];
            $temp = [];
            
            $camas_prestadas = (array_slice($data, 12));
            $i = 1;
            $limite = count($camas_prestadas)/3;
            foreach ($camas_prestadas as $key => $value) {
                if( $i <= $limite){
                    if( ($data['especialidad'.$i] !== "null") && ($data['cantidad'.$i] > 0) && ($data['tipo_ingreso'.$i] !== "null") ){
                        $temp = [
                            'fecha' => $data['fecha'],
                            'servicio' => $data['servicio'],
                            'especialidad' => $data['especialidad'.$i],
                            'cantidad' => (int)$data['cantidad'.$i],
                            'tipo_ingreso' => $data['tipo_ingreso'.$i]
                        ];
                        array_push($rowData, $temp);
                    }
                    $i++;
                }
            }
            print_r($rowData); 
            print_r($limite); 
            return $rowData; 
        }

        public function buscar($data){
            if($data['fechaInicio'] !== null && $data['fechaFin'] !== null && $data['servicioBuscar'] !== null){
                $resultado = $this->DFormulario->buscar($data);
                if( !empty($resultado)){
                    $message = "Datos obtenidos satisfactoriamente";

                    http_response_code(200);
                    echo json_encode([
                        'status' => 'success',
                        'data' => ($resultado),
                        'message' => $message
                    ]);
                    exit;
                }else{
                    http_response_code(200);
                    echo json_encode(
                        ['failed' => 'No se encontraron registros de esta(s) fecha(s) y servicio'
                    ]);
                    exit;
                }

            }
        }


        public function comprobarMes($fecha){
            $fechaActual = new DateTime('', new DateTimeZone('America/La_Paz'));
            $mesActual = date("m", strtotime($fechaActual->format('Y-m-d')));
            $diaActual = date("d", strtotime($fechaActual->format('Y-m-d')));
            
            $fechaInput = new DateTime($fecha, new DateTimeZone('America/La_Paz'));            
            $mesInput = date("m", strtotime($fechaInput->format('Y-m-d')));
            $diaInput = date("d", strtotime($fechaInput->format('Y-m-d')));
            if($mes)
            echo $mesActual ." - ". $mesInput;
        }
    }
?>