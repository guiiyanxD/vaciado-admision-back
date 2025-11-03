<?php
//API AIzaSyDxiJn_COshebr3jCB1l_p-SOF14ipBTRk

require('../vendor/autoload.php');
use Google\Cloud\BigQuery\BigQueryClient;


class Connection{
    private $bigQuery;
    private $dataset;
    private $table;

    public function __construct() {
        if($this->bigQuery == null){
            $this->bigQuery = new BigQueryClient([
                'keyFilePath' => '../plenary-glass-470415-k1-8060526602ec.json',
                'projectId' => 'plenary-glass-470415-k1',
            ]);
            $this->dataset = $this->bigQuery->dataset('AdmisionVaciado');
            $this->table = $this->dataset->table('movimiento_hospitalario');
        }
    }

    public function getBigQuery() {
        return $this->bigQuery;
    }

    public function getDataset() {
        return $this->dataset;
    }

    public function getTable() {
        return $this->table;
    }

    public function setTable($tableName) {
        $this->table = $this->dataset->table($tableName);
    }

    public function insertData() {
    // Preparar datos
        $rowData = [
            'fecha' => 'Ya llego camacho', 
            'servicio' => 'el gober', 
            'ingreso' => 0, 
            'ing_traslado' => 1, 
            'egreso' => 2, 
            'egreso_traslado' => 3, 
            'obito' => 4, 
            'aislamiento' => 5,
            'bloqueada' => 6, 
            'total' => 7, 
            'dotacion' => 8, 
            'libre' => 9
        ];
        
        $table = $this->getTable();
        
        try {
            // Insertar con formato correcto
            $response = $table->insertRows([
                ['data' => $rowData]
            ]);
            
            if ($response->isSuccessful()) {
                echo "✅ Datos insertados correctamente";
                return true;
            } else {
                echo "❌ Error en la inserción:\n";
                
                // Debug detallado
                $failedRows = $response->failedRows();
                if (!empty($failedRows)) {
                    foreach ($failedRows as $index => $failedRow) {
                        echo "Fila {$index} falló:\n";
                        foreach ($failedRow['errors'] as $error) {
                            echo "  - {$error['reason']}: {$error['message']}\n";
                        }
                    }
                }
                
                return false;
            }
            
        } catch (\Google\Cloud\Core\Exception\GoogleException $e) {
            echo "❌ Google Exception: " . $e->getMessage() . "\n";
            return false;
        } catch (Exception $e) {
            echo "❌ General Exception: " . $e->getMessage() . "\n";
            return false;
        }
    }
}
?>