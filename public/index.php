<?php
require_once("../negocio/Formulario/NFormulario.php");
require_once("../negocio/Servicios/NServicios.php");
require_once("../negocio/Especialidades/NEspecialidades.php");
 require_once("../negocio/Compensaciones/NCompensaciones.php");

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
    //print_r($data);
    $result = $formulario->obtenerCenso($data);
    
    return $result;
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

if($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/reporte-mensual'){
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    if (!isset($data['fechaInicio']) || !isset($data['fechaFin'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: fechaInicio and fechaFin']);
        exit;
    }

    $formulario = new NFormulario();
    $reporte = $formulario->reporteMensual($data);
    
    return $reporte;
    exit;
}


// ============================================================
// RUTAS DEL MÓDULO DE COMPENSACIONES
// Agregar en public/index.php junto a los require_once del inicio
// ============================================================
 
// require_once("../negocio/Compensaciones/NCompensaciones.php");
 
 
// ============================================================
// PERSONAL — ABM
// ============================================================
 
// GET /compensaciones/personal  → listar todo el personal
if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/compensaciones/personal') {
    $comp = new NCompensaciones();
    $comp->getAllPersonal();
    exit;
}
 
// GET /compensaciones/personal/activo  → solo personal activo (para selects)
if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/compensaciones/personal/activo') {
    $comp = new NCompensaciones();
    $comp->getPersonalActivo();
    exit;
}
 
// POST /compensaciones/personal  → crear funcionario
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/personal') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['nombres']) || !isset($data['apellidos'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: nombres and apellidos']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->crearPersonal($data);
    exit;
}
 
// PUT /compensaciones/personal  → actualizar funcionario
if ($_SERVER['REQUEST_METHOD'] == 'PUT' && $_SERVER['REQUEST_URI'] === '/compensaciones/personal') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['id'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameter: id']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->actualizarPersonal($data);
    exit;
}
 
// DELETE /compensaciones/personal  → eliminar funcionario
if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && $_SERVER['REQUEST_URI'] === '/compensaciones/personal') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['id'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameter: id']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->eliminarPersonal($data);
    exit;
}
 
// ============================================================
// COMPENSACIONES — CRUD
// ============================================================
 
// POST /compensaciones/registro  → crear o actualizar un registro (upsert)
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/registro') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['personal_id']) || !isset($data['anho']) || !isset($data['mes'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: personal_id, anho and mes']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->guardarCompensacion($data);
    exit;
}
 
// POST /compensaciones/registro/buscar  → obtener un registro puntual
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/registro/buscar') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['personal_id']) || !isset($data['anho']) || !isset($data['mes'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: personal_id, anho and mes']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->getRegistro($data);
    exit;
}
 
// DELETE /compensaciones/registro  → eliminar un registro puntual
if ($_SERVER['REQUEST_METHOD'] == 'DELETE' && $_SERVER['REQUEST_URI'] === '/compensaciones/registro') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['personal_id']) || !isset($data['anho']) || !isset($data['mes'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: personal_id, anho and mes']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->eliminarCompensacion($data);
    exit;
}
 
// ============================================================
// CONSULTAS
// ============================================================
 
// POST /compensaciones/persona-anho  → todos los registros de una persona en un año
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/persona-anho') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    if (!isset($data['personal_id']) || !isset($data['anho'])) {
        http_response_code(400);
        echo json_encode(['error' => 'Missing required parameters: personal_id and anho']);
        exit;
    }
 
    $comp = new NCompensaciones();
    $comp->getRegistrosPorPersonaAnho($data);
    exit;
}
 
// POST /compensaciones/resumen-anual  → resumen tipo RECUENTO para un año
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/resumen-anual') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    $comp = new NCompensaciones();
    $comp->getResumenAnual($data);
    exit;
}
 
// POST /compensaciones/resumen-multi-anho  → resumen RECUENTO para varios años
if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_SERVER['REQUEST_URI'] === '/compensaciones/resumen-multi-anho') {
    $json = file_get_contents('php://input');
    $data = json_decode($json, true);
 
    $comp = new NCompensaciones();
    $comp->getResumenMultiAnho($data);
    exit;
}
 
// GET /compensaciones/anhos  → años disponibles en la BD
if ($_SERVER['REQUEST_METHOD'] == 'GET' && $_SERVER['REQUEST_URI'] === '/compensaciones/anhos') {
    $comp = new NCompensaciones();
    $comp->getAnhosDisponibles();
    exit;
}
