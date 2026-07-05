<?php

namespace Admision\Negocio\Servicios;

use Admision\Datos\Servicios\DServicios;
use Admision\Negocio\RespuestaJson;

class NServicios{
    use RespuestaJson;

    private $capaDatos;

    public function __construct(){
        $this->capaDatos = new DServicios();
    }

    public function getAllServicios(){
        $servicios = $this->capaDatos->getAllServicios();
        $this->respuestaExito(200, 'Servicios obtenidos', $servicios);
    }
}