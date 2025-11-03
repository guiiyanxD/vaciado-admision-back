<?php 
require_once("../config/connection.php");
    class DFormulario {
        
        private $conn;
        
        public function __construct(){
            $this->conn = new Connection();
        }

        public function getServicios(){
            $query = "SELECT * FROM `plenary-glass-470415-k1.AdmisionVaciado.servicios` order by nombre ASC";
            $stmt = $this->conn->getBigQuery()->query($query);
            $queryResults = $this->conn->getBigQuery()->runQuery($stmt);
            $i = 0;
            $array = [];
            foreach ($queryResults as $row) {
                $array[$i]['nombre'] = $row['nombre'];    
                $array[$i]['cant_camas'] = $row['cant_camas'];
                $array[$i]['especialidad'] = $row['especialidad'];
                $i++;
            }
            return $array;
        }

        public function getEspecialidades(){
            $query = "SELECT * FROM `plenary-glass-470415-k1.AdmisionVaciado.especialidades` order by nombre ASC";
            $stmt = $this->conn->getBigQuery()->query($query);
            $queryResults = $this->conn->getBigQuery()->runQuery($stmt);
            $i = 0;
            $array = [];
            foreach ($queryResults as $row) {
                $array[$i]['id'] = $row['id'];    
                $array[$i]['nombre'] = $row['nombre'];    
                $i++;
            }
            return $array;
        }

        public function guardarDatos($data) {
            $query = "INSERT INTO `plenary-glass-470415-k1.AdmisionVaciado.movimiento_hospitalario` (fecha, servicio, ingreso, ing_traslado, egreso, egreso_traslado, obito, aislamiento, bloqueada, total, dotacion, libre) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $rowData = [
                'fecha'             => $data['fecha'], 
                'servicio'          => $data['servicio'], 
                'ingreso'           => $data['ingreso'], 
                'ing_traslado'      => $data['ingreso_traslado'], 
                'egreso'            => $data['egreso'], 
                'egreso_traslado'   => $data['egreso_traslado'], 
                'obito'             => $data['obito'], 
                'aislamiento'       => $data['aislamiento'],
                'bloqueada'         => $data['bloqueada'], 
                'total'             => $data['total'], 
                'dotacion'          => $data['dotacion'], 
                'libre'             => $data['libres'],
            ];
            $table = $this->conn->getTable();
            try {
                // Insertar con formato correcto
                $response = $table->insertRows([
                    ['data' => $rowData]
                ]);
                
                if ($response->isSuccessful()) {
                    echo json_encode([
                        'status' => 'success',
                        'message' => 'Datos insertados correctamente'
                    ]);
                } else {
                    $message = "";
                    
                    // Debug detallado
                    $failedRows = $response->failedRows();
                    if (!empty($failedRows)) {
                        foreach ($failedRows as $index => $failedRow) {
                            $message .=   "Fila {$index} falló:\n";
                            foreach ($failedRow['errors'] as $error) {
                                $message .= "  - {$error['reason']}: {$error['message']}\n";
                            }
                        }
                    }

                    echo json_encode([
                        'status' => 'error',
                        'message' => $message,
                    ]);
                }
                
            } catch (\Google\Cloud\Core\Exception\GoogleException $e) {
                echo " Google Exception: " . $e->getMessage() . "\n";
                return false;
            } catch (Exception $e) {
                echo " General Exception: " . $e->getMessage() . "\n";
                return false;
            }
        }

        public function getTotalAyer($data) {
            $query = "SELECT fecha, servicio, total as total FROM `plenary-glass-470415-k1.AdmisionVaciado.movimiento_hospitalario` WHERE fecha = '".$data['fecha']."' AND servicio = '".$data['servicio']."'";
            $stmt = $this->conn->getBigQuery()->query($query);
            $queryResults = $this->conn->getBigQuery()->runQuery($stmt);
            $totalAyer = -2;
            foreach ($queryResults as $row) {
                $totalAyer = $row['total'];
            }
            return $totalAyer;
        }

        public function verificarYGuardar($data){
            $query = "MERGE `plenary-glass-470415-k1.AdmisionVaciado.movimiento_hospitalario` AS T
                    USING (
                        SELECT
                            '".$data['fecha']."' AS fecha,
                            '".$data['servicio']."' AS servicio,
                            ".$data['ingreso']." AS ingreso,
                            ".$data['ingreso_traslado']." AS ing_traslado,
                            ".$data['egreso']." AS egreso,
                            ".$data['egreso_traslado']." AS egreso_traslado,
                            ".$data['obito']." AS obito,
                            ".$data['aislamiento']." AS aislamiento,
                            ".$data['bloqueada']." AS bloqueada,
                            ".$data['total']." AS total,
                            ".$data['dotacion']." AS dotacion,
                            ".$data['libre']." AS libre
                        ) AS S
                    ON T.fecha = S.fecha AND T.servicio = S.servicio
                    WHEN NOT MATCHED THEN
                        INSERT (fecha, servicio, ingreso, ing_traslado, egreso, egreso_traslado, obito, libre, bloqueada, aislamiento, dotacion, total)
                        VALUES (S.fecha, S.servicio, S.ingreso, S.ing_traslado, S.egreso, S.egreso_traslado, S.obito, S.libre, S.bloqueada, S.aislamiento, S.dotacion, S.total)";

            $bigQuery = $this->conn->getBigQuery();

            try {
                $job = $bigQuery->runQuery($bigQuery->query($query), [
                    'configuration' => [
                        'query' => [
                            'useLegacySql' => false
                        ]
                    ]
                ]);

                $job->waitUntilComplete();

                if ($job->isComplete()) {
                    return $job->info()["numDmlAffectedRows"];                    
                } else {
                    $error = $job->info()['status']['errorResult'] ?? 'Unknown error';
                    throw new \Exception('BigQuery job failed: ' . json_encode($error));
                }
            } catch (\Google\Cloud\Core\Exception\ServiceException $e) {
                throw new \Exception("Error en la operación de BigQuery: " . $e->getMessage());
            }
        }

        public function buscar($data){
            if($data['servicioBuscar'] !== "todos"){
                $query =" SELECT * FROM `plenary-glass-470415-k1.AdmisionVaciado.movimiento_hospitalario` WHERE fecha BETWEEN '".$data['fechaInicio']."' AND '".$data['fechaFin']."' AND servicio='".$data['servicioBuscar']."' order by fecha ASC";
            }else{
                $query =" SELECT * FROM `plenary-glass-470415-k1.AdmisionVaciado.movimiento_hospitalario` WHERE fecha BETWEEN '".$data['fechaInicio']."' AND '".$data['fechaFin']."' ORDER BY fecha ASC";
            }
            $stmt = $this->conn->getBigQuery()->query($query);
            $queryResults = $this->conn->getBigQuery()->runQuery($stmt);
            $i = 0;
            $array = [];
            foreach ($queryResults as $row) {
                $array[$i]['fecha'] = $row['fecha'];    
                $array[$i]['servicio'] = $row['servicio'];
                $array[$i]['ingreso'] = $row['ingreso'];
                $array[$i]['ing_traslado'] = $row['ing_traslado'];
                $array[$i]['egreso'] = $row['egreso'];
                $array[$i]['egreso_traslado'] = $row['egreso_traslado'];
                $array[$i]['obito'] = $row['obito'];
                $array[$i]['aislamiento'] = $row['aislamiento'];
                $array[$i]['bloqueada'] = $row['bloqueada'];
                $array[$i]['total'] = $row['total'];
                $i++;
            }
            return $array;
        }

        public function guardarCamasPrestadas($camasPrestadas){
            $table = $this->conn->getBigQuery()->dataset('AdmisionVaciado')->table('camas_prestadas');
            $rows = [];
            foreach ($camasPrestadas as $row) {
                $rows[] = ['data' => $row];
            }
            try {
               
              
                $response = $table->insertRows($rows);
                if ($response->isSuccessful()) {
                    return true;
                } else {
                    $message = "";
                    
                   
                    $failedRows = $response->failedRows();
                    if (!empty($failedRows)) {
                        foreach ($failedRows as $index => $failedRow) {
                            $message .=   "Fila {$index} falló:\n";
                            foreach ($failedRow['errors'] as $error) {
                                $message .= "  - {$error['reason']}: {$error['message']}\n";
                            }
                        }
                    }
                    throw new \Exception('Error al insertar filas: ' . $message);

                }
                
            } catch (\Google\Cloud\Core\Exception\GoogleException $e) {
                echo " Google Exception: " . $e->getMessage() . "\n";
                return false;
            } catch (Exception $e) {
                echo " General Exception: " . $e->getMessage() . "\n";
                return false;
            }
        }
    }