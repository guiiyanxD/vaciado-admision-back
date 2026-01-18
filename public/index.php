<?php
require_once("../negocio/Formulario/NFormulario.php");
require_once("../negocio/Servicios/NServicios.php");
require_once("../negocio/Especialidades/NEspecialidades.php");

// ========================================
// CONFIGURACIÓN CORS
// ========================================
// IMPORTANTE: Sin la barra diagonal al final
header("Access-Control-Allow-Origin: https://admision--vaciado-463127106629.us-central1.run.app");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=utf-8");

// Maneja peticiones preflight OPTIONS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit(0);
}

// ========================================
// RUTAS
// ========================================

if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/') {
    http_response_code(200);
    echo json_encode(['message' => 'entrypoint funcionando']);
    exit;
}

/*if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/formulario') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
    $formulario = new NFormulario();
    $formulario->guardarDatos($data);

    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'message' => 'Datos guardados correctamente',
        'received_data' => $data
    ]);
    exit;
}*/

if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/servicios') {
    $Servicios = new NServicios();
    $result = $Servicios->getAllServicios();
    
    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'data' => $result
    ]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/especialidades') {
    $especialidades = new NEspecialidades();
    $result = $especialidades->getAllEspecialidades();
    
    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'data' => $result
    ]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/totalAyer') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!isset($data['fecha']) || !isset($data['servicio'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: fecha and servicio']);
        exit;
    }

    $formulario = new NFormulario();
    $total = $formulario->getTotalAyer($data);
    
    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'data' => $total
    ]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/totalAyer2') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (isset($data['fecha']) && isset($data['servicio'])) {
        $formulario = new NFormulario();
        $total = $formulario->getTotalAyer($data);
        
        return $total;
        exit;
    } else {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters']);
        exit;
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/verificarYGuardar') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
    
    $formulario = new NFormulario();
    $formulario->verificarYGuardar($data);
    //$result = $formulario->test();

}

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/buscar') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    $formulario = new NFormulario();
    $result = $formulario->buscar($data);
    
    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'data' => $result
    ]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/comprobarMes') {
    $formulario = new NFormulario();
    $result = $formulario->comprobarMes("2025-08-08");
    
    http_response_code(200);
    echo json_encode([
        'status' => 'success',
        'data' => $result
    ]);
    exit;
}

