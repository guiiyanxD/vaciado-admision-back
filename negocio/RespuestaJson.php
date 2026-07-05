<?php

namespace Admision\Negocio;

trait RespuestaJson {

    private function respuestaExito($codigo, $mensaje, $data = null) {
        http_response_code($codigo);
        echo json_encode([
            'status' => 'success',
            'message' => $mensaje,
            'data' => $data
        ]);
    }

    private function respuestaError($codigo, $mensaje) {
        http_response_code($codigo);
        echo json_encode([
            'status' => 'failed',
            'message' => $mensaje
        ]);
    }
}
