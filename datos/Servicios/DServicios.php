<?php 
require_once("../config/Pgsql.php");
class DServicios{

    private $conn;

    public function __construct(){
        $this->conn = PgsqlConnection::getInstance();
    }

    public function getAllServicios(){
        $query = "SELECT *
            FROM servicios ORDER BY nombre ASC";

        try {
            $stmt = $this->conn->getConnection()->prepare($query);
            
            
            $success = $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            if (!$success) {
                $errorInfo = $stmt->errorInfo();
                error_log("Error SQL: " . print_r($errorInfo, true));
                throw new \Exception("Error al ejecutar la consulta SQL.");
            }
            return $result;

        } catch (\Exception $e) {
            throw new \Exception("Error al obtener los datos de la BD: " . $e->getMessage());
        }
    }
}