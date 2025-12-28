<?php 
require_once('../datos/Especialidades/DEspecialidades.php');
class NEspecialidades{

    private $capaDatos;

    public function __construct(){

        $this->capaDatos = new DEspecialidades();
    }

    public function getAllEspecialidades(){
        $especialidades = $this->capaDatos->getAllEspecialidades();
        http_response_code(200);
        echo json_encode([            
            'status' => 'success',
            'data' => $especialidades
        ]);

    }
}