<?php

require_once("../datos/Servicios/DServicios.php");

class NServicios{
    
    private $capaDatos;

    public function __construct(){
        $this->capaDatos = new DServicios();
    }

    public function getAllServicios(){
        $servicios = $this->capaDatos->getAllServicios();
            http_response_code(200);
            echo json_encode([
                'status' => 'success',
                'data' => $servicios
            ]);
        exit;
    }
}