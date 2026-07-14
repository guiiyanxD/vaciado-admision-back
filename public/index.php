<?php
require_once("../vendor/autoload.php");

use Admision\Negocio\Formulario\NFormulario;
use Admision\Negocio\Servicios\NServicios;
use Admision\Negocio\Especialidades\NEspecialidades;
use Admision\Negocio\Compensaciones\NCompensaciones;

// Carga variables desde .env si existe (desarrollo local).
// En Cloud Run las variables ya vienen inyectadas en el entorno, por eso safeLoad().
Dotenv\Dotenv::createImmutable(dirname(__DIR__))->safeLoad();

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
// Cada handler recibe el cuerpo JSON ya decodificado (o [] si no aplica) y
// es el único responsable de validar sus parámetros y emitir la respuesta.

function cuerpoJson() {
    return json_decode(file_get_contents('php://input'), true) ?? [];
}

$rutas = [

    'GET /' => function () {
        http_response_code(200);
        echo json_encode(['message' => 'entrypoint funcionando']);
    },

    // ---------- Catálogos ----------
    'GET /servicios' => function () {
        (new NServicios())->getAllServicios();
    },
    'GET /especialidades' => function () {
        (new NEspecialidades())->getAllEspecialidades();
    },

    // ---------- Censo / Formulario ----------
    'POST /totalAyer' => function () {
        (new NFormulario())->getTotalAyer(cuerpoJson());
    },
    'POST /totalAyer2' => function () {
        (new NFormulario())->getTotalAyer(cuerpoJson());
    },
    'POST /verificarYGuardar' => function () {
        (new NFormulario())->verificarYGuardar(cuerpoJson());
    },
    'POST /buscar' => function () {
        (new NFormulario())->obtenerCenso(cuerpoJson());
    },
    'POST /reporte-mensual' => function () {
        (new NFormulario())->reporteMensual(cuerpoJson());
    },
    'POST /reporte-camas-prestadas' => function () {
        (new NFormulario())->reporteCamasPrestadas(cuerpoJson());
    },
    'POST /reporte-kpis' => function () {
        (new NFormulario())->reporteKpis(cuerpoJson());
    },

    // ---------- Compensaciones: Personal (ABM) ----------
    'GET /compensaciones/personal' => function () {
        (new NCompensaciones())->getAllPersonal();
    },
    'GET /compensaciones/personal/activo' => function () {
        (new NCompensaciones())->getPersonalActivo();
    },
    'POST /compensaciones/personal' => function () {
        (new NCompensaciones())->crearPersonal(cuerpoJson());
    },
    'PUT /compensaciones/personal' => function () {
        (new NCompensaciones())->actualizarPersonal(cuerpoJson());
    },
    'DELETE /compensaciones/personal' => function () {
        (new NCompensaciones())->eliminarPersonal(cuerpoJson());
    },

    // ---------- Compensaciones: CRUD ----------
    'POST /compensaciones/registro' => function () {
        (new NCompensaciones())->guardarCompensacion(cuerpoJson());
    },
    'POST /compensaciones/registro/buscar' => function () {
        (new NCompensaciones())->getRegistro(cuerpoJson());
    },
    'DELETE /compensaciones/registro' => function () {
        (new NCompensaciones())->eliminarCompensacion(cuerpoJson());
    },

    // ---------- Compensaciones: Consultas ----------
    'POST /compensaciones/persona-anho' => function () {
        (new NCompensaciones())->getRegistrosPorPersonaAnho(cuerpoJson());
    },
    'POST /compensaciones/resumen-anual' => function () {
        (new NCompensaciones())->getResumenAnual(cuerpoJson());
    },
    'POST /compensaciones/resumen-multi-anho' => function () {
        (new NCompensaciones())->getResumenMultiAnho(cuerpoJson());
    },
    'GET /compensaciones/anhos' => function () {
        (new NCompensaciones())->getAnhosDisponibles();
    },

    // ---------- Compensaciones: Descuentos ----------
    'POST /compensaciones/saldo-pendiente' => function () {
        (new NCompensaciones())->getSaldoPendientePorGestion(cuerpoJson());
    },
    'POST /compensaciones/descuento' => function () {
        (new NCompensaciones())->registrarDescuento(cuerpoJson());
    },
    'POST /compensaciones/descuentos' => function () {
        (new NCompensaciones())->getDescuentosPorPersona(cuerpoJson());
    },
    'DELETE /compensaciones/descuento' => function () {
        (new NCompensaciones())->eliminarDescuento(cuerpoJson());
    },
];

$clave = $_SERVER['REQUEST_METHOD'] . ' ' . $_SERVER['REQUEST_URI'];

if (isset($rutas[$clave])) {
    $rutas[$clave]();
    exit;
}

http_response_code(404);
echo json_encode(['status' => 'failed', 'message' => 'Ruta no encontrada']);
