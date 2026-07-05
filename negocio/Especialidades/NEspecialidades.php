<?php

namespace Admision\Negocio\Especialidades;

use Admision\Datos\Especialidades\DEspecialidades;
use Admision\Negocio\RespuestaJson;

class NEspecialidades{
    use RespuestaJson;

    private $capaDatos;

    public function __construct(){
        $this->capaDatos = new DEspecialidades();
    }

    public function getAllEspecialidades(){
        $especialidades = $this->capaDatos->getAllEspecialidades();
        $this->respuestaExito(200, 'Especialidades obtenidas', $especialidades);
    }
}