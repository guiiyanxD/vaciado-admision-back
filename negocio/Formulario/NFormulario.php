<?php

namespace Admision\Negocio\Formulario;

use Admision\Datos\Formulario\DFormulario;
use Admision\Negocio\RespuestaJson;
use DateTime;
use Exception;

class NFormulario {
    use RespuestaJson;

    private $DFormulario;

    public function __construct() {
        $this->DFormulario = new DFormulario();
    }

    /**
     * Verificar y guardar censo con camas prestadas
     * 
     * @param array $data Datos en formato: { censo: {}, camasPrestadas: [] }
     * @return array Respuesta con status, message y data
     */
    public function verificarYGuardar($data) {
        
        try {
            // Validar que vengan los datos mínimos requeridos
            if (!isset($data['censo']) || !is_array($data['censo'])) {
                return $this->respuestaError(400, 'Estructura de datos inválida: falta objeto "censo"');
            }

            $censo = $data['censo'];
            
            // Validar campos requeridos del censo
            if (empty($censo['fecha']) || empty($censo['servicio'])) {
                return $this->respuestaError(400, 'Datos incompletos: fecha y servicio son requeridos');
            }

            // Regla de negocio: cierre de mes — no se puede cargar/editar un mes ya cerrado
            if (!$this->fechaEsEditable($censo['fecha'])) {
                return $this->respuestaError(409, $this->mensajeMesCerrado($censo['fecha']));
            }

            // Iniciar transacción para garantizar atomicidad
            $this->DFormulario->iniciarTransaccion();

            try {
                $filasAfectadasCenso = $this->DFormulario->verificarYGuardar($censo);
                
                $filasAfectadasCamas = 0;
                if (isset($data['camasPrestadas']) && is_array($data['camasPrestadas']) && count($data['camasPrestadas']) > 0) {
                    
                    $camasValidas = $this->validarCamasPrestadas($data['camasPrestadas']);
                    
                    if (count($camasValidas) > 0) {
                        $camasConRelacion = $this->agregarRelacionCenso($camasValidas, $censo['fecha'], $censo['servicio']);
                        
                        $this->DFormulario->eliminarCamasPrestadas($censo['fecha'], $censo['servicio']);
                        
                        $filasAfectadasCamas = $this->DFormulario->guardarCamasPrestadas($camasConRelacion);
                    }
                }

                $this->DFormulario->confirmarTransaccion();

                
                $totalFilas = $filasAfectadasCenso + $filasAfectadasCamas;
                $mensaje = sprintf(
                    "Operación exitosa: %d registro(s) de censo, %d cama(s) prestada(s)",
                    $filasAfectadasCenso,
                    $filasAfectadasCamas
                );
                
                $this->respuestaExito(200, $mensaje, [
                    'censo' => $filasAfectadasCenso,
                    'camas_prestadas' => $filasAfectadasCamas,
                    'total' => $totalFilas
                ]);
                

            } catch (Exception $e) {
                // Rollback en caso de error
                $this->DFormulario->revertirTransaccion();
                throw $e;
            }

        } catch (Exception $e) {
            $this->respuestaError(500, 'Error al procesar datos: ' . $e->getMessage());
        }
    }

    /**
     * Validar que las camas prestadas tengan la estructura correcta
     * 
     * @param array $camasPrestadas Array de objetos con estructura: 
     *                              { especialidad, cantidad, tipo_ingreso }
     * @return array Array filtrado con solo camas válidas
     */
    private function validarCamasPrestadas($camasPrestadas) {
        $camasValidas = [];

        foreach ($camasPrestadas as $index => $cama) {
            // Verificar que sea un array/objeto
            if (!is_array($cama)) {
                continue;
            }

            // Verificar campos requeridos
            if (empty($cama['especialidad']) || 
                empty($cama['tipo_ingreso']) || 
                !isset($cama['cantidad'])) {
                continue;
            }

            // Validar cantidad
            $cantidad = (int)$cama['cantidad'];
            if ($cantidad <= 0) {
                continue;
            }

            // Validar tipo_ingreso
            $tipo_ingreso = strtoupper(trim($cama['tipo_ingreso']));
            if (!in_array($tipo_ingreso, ['DIRECTO', 'TRASLADO'])) {
                continue;
            }

            // Agregar a las camas válidas
            $camasValidas[] = [
                'especialidad' => trim($cama['especialidad']),
                'cantidad' => $cantidad,
                'tipo_ingreso' => $tipo_ingreso
            ];
        }

        return $camasValidas;
    }

    /**
     * Agregar fecha y servicio a cada cama prestada
     * 
     * @param array $camas Array de camas validadas
     * @param string $fecha Fecha del censo
     * @param string $servicio Servicio del censo
     * @return array Camas con relación al censo
     */
    private function agregarRelacionCenso($camas, $fecha, $servicio) {
        return array_map(function($cama) use ($fecha, $servicio) {
            return array_merge($cama, [
                'fecha' => $fecha,
                'servicio' => $servicio
            ]);
        }, $camas);
    }

    /**
     * Determina si una fecha pertenece a un mes editable, según la regla de "cierre de mes":
     * - El mes en curso siempre es editable.
     * - El mes anterior solo es editable durante el período de gracia (día 1 al 5 del mes en curso).
     * - Cualquier otro mes (más antiguo, o futuro) está bloqueado.
     *
     * @param string $fecha
     * @return bool
     */
    private function fechaEsEditable($fecha) {
        $fecha = new DateTime($fecha);
        $hoy = new DateTime();

        $mesesEditables = [$hoy->format('Y-m')];

        if ((int)$hoy->format('d') <= 5) {
            $mesAnterior = (clone $hoy)->modify('first day of last month');
            $mesesEditables[] = $mesAnterior->format('Y-m');
        }

        return in_array($fecha->format('Y-m'), $mesesEditables, true);
    }

    /**
     * Mensaje de error legible para cuando se intenta guardar en un mes cerrado.
     *
     * @param string $fecha
     * @return string
     */
    private function mensajeMesCerrado($fecha) {
        $meses = [
            1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril', 5 => 'mayo', 6 => 'junio',
            7 => 'julio', 8 => 'agosto', 9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
        ];
        $fecha = new DateTime($fecha);
        $nombreMes = $meses[(int)$fecha->format('n')];

        return sprintf(
            'No se puede guardar: el mes de %s de %s ya está cerrado. Solo se puede cargar el mes en curso (y el anterior hasta el día 5).',
            $nombreMes,
            $fecha->format('Y')
        );
    }

    /**
     * Obtener censo completo con camas prestadas
     *
     * @param string $fecha
     * @param string $servicio
     * @return array Respuesta con status y data
     */
    public function obtenerCenso($data) {
        try {
            if (empty($data['fechaInicio']) || empty($data['servicioBuscar'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fecha de inicio y servicio son requeridos');
            }
            if( !empty($data['fechaFin']) ){ //un rango de fechas
                $censoCompleto = $this->DFormulario->obtenerCensoCompletoRangoFechas($data['fechaInicio'], $data['fechaFin'], $data['servicioBuscar']);
            }else{
                $censoCompleto = $this->DFormulario->obtenerCensoCompleto($data['fechaInicio'], $data['servicioBuscar']);
            }

            if ($censoCompleto) {
                $array = [$censoCompleto];
                return $this->respuestaExito(200, 'Censo encontrado', $censoCompleto);
            } else {
                return $this->respuestaError(404, 'Censo no encontrado');
            }

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener censo: ' . $e->getMessage());
        }
    }

    public function getTotalAyer($data){
        try {
            if (!isset($data['fecha']) || !isset($data['servicio'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fecha y servicio son requeridos');
            }

            $total = $this->DFormulario->getTotalAyer($data['fecha'], $data['servicio']);

            return $this->respuestaExito(200, 'Total obtenido', $total);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener total: ' . $e->getMessage());
        }
    }

    public function reporteMensual($data){
        try {
            if (!isset($data['fechaInicio']) || !isset($data['fechaFin'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fechaInicio y fechaFin son requeridos');
            }

            $detalle = isset($data['detalle']) ? (bool)$data['detalle'] : true;

            $reporte = $this->DFormulario->reporteMensual($data['fechaInicio'], $data['fechaFin'], $detalle);

            return $this->respuestaExito(200, 'Reporte mensual obtenido', $reporte);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener reporte mensual: ' . $e->getMessage());
        }
    }

    public function reporteCamasPrestadas($data){
        try {
            if (empty($data['fechaInicio']) || empty($data['fechaFin'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fechaInicio y fechaFin son requeridos');
            }

            $servicio = !empty($data['servicio']) ? $data['servicio'] : 'todos';
            $especialidad = !empty($data['especialidad']) ? $data['especialidad'] : 'todas';
            $tipoIngreso = !empty($data['tipoIngreso']) ? $data['tipoIngreso'] : 'AMBOS';

            $reporte = $this->DFormulario->reporteCamasPrestadas(
                $data['fechaInicio'],
                $data['fechaFin'],
                $servicio,
                $especialidad,
                $tipoIngreso
            );

            return $this->respuestaExito(200, 'Reporte de camas prestadas obtenido', $reporte);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener reporte de camas prestadas: ' . $e->getMessage());
        }
    }

    public function reporteKpis($data){
        try {
            if (empty($data['fechaInicio']) || empty($data['fechaFin'])) {
                return $this->respuestaError(400, 'Parámetros faltantes: fechaInicio y fechaFin son requeridos');
            }

            $reporte = $this->DFormulario->reporteKpis($data['fechaInicio'], $data['fechaFin']);

            return $this->respuestaExito(200, 'KPIs obtenidos', $reporte);

        } catch (Exception $e) {
            return $this->respuestaError(500, 'Error al obtener KPIs: ' . $e->getMessage());
        }
    }
}
?>