<?php

/**
 * Importa el historial real de compensaciones desde
 * "D:\DIANE\RECUENTO DE HORAS EXTRAORDINARIAS\LISTADO COMPENSACIONES .xlsx"
 * hacia la tabla `compensaciones`.
 *
 * Uso:
 *   php importar-compensaciones.php              -> dry-run (no escribe nada)
 *   php importar-compensaciones.php --confirmar  -> escribe de verdad, en una transacción
 *
 * El archivo se abre siempre en modo solo lectura y nunca se re-guarda.
 */

require_once __DIR__ . '/../vendor/autoload.php';

use Admision\Config\PgsqlConnection;
use PhpOffice\PhpSpreadsheet\IOFactory;

const RUTA_EXCEL = 'D:\\DIANE\\RECUENTO DE HORAS EXTRAORDINARIAS\\LISTADO COMPENSACIONES .xlsx';
const HOJAS_ANIOS = ['2020', '2021', '2022', '2023', '2024', '2025', '2026'];
const ETIQUETAS_METRICA = ['HORAS PROGRAMADAS', 'HORAS PAGADAS', 'PERMISOS EN HORAS', 'SALDO DE HORAS'];

$modoConfirmar = in_array('--confirmar', $argv, true);

// =====================================================
// Normalización y emparejamiento de nombres
// =====================================================

function normalizarNombre(string $raw): string
{
    $s = str_replace(["\n", "\r"], ' ', $raw);
    $s = preg_replace('/\bMES\b/ui', ' ', $s);
    $s = preg_replace('/\s+/', ' ', trim($s));
    return mb_strtoupper($s, 'UTF-8');
}

function palabras(string $nombreNormalizado): array
{
    return array_values(array_filter(explode(' ', $nombreNormalizado), fn($w) => $w !== ''));
}

function coincidePalabra(string $x, string $y): bool
{
    if ($x === $y) return true;
    $xs = rtrim($x, '.');
    $ys = rtrim($y, '.');
    if (strlen($xs) === 1) return $ys !== '' && $ys[0] === $xs;
    if (strlen($ys) === 1) return $xs !== '' && $xs[0] === $ys;
    return $xs === $ys;
}

function coincideConjuntoPalabras(array $a, array $b): bool
{
    $bDisponibles = $b;
    foreach ($a as $palabraA) {
        $encontrada = false;
        foreach ($bDisponibles as $i => $palabraB) {
            if (coincidePalabra($palabraA, $palabraB)) {
                unset($bDisponibles[$i]);
                $encontrada = true;
                break;
            }
        }
        if (!$encontrada) return false;
    }
    return count($bDisponibles) === 0;
}

function emparejarPersonal(string $nombreExcelRaw, array $personalList): ?array
{
    $palabrasExcel = palabras(normalizarNombre($nombreExcelRaw));
    foreach ($personalList as $p) {
        $palabrasDb = palabras(normalizarNombre($p['nombres'] . ' ' . $p['apellidos']));
        if (coincideConjuntoPalabras($palabrasExcel, $palabrasDb)) {
            return $p;
        }
    }
    return null;
}

// =====================================================
// Lectura del Excel
// =====================================================

function valorCelda($sheet, int $col, int $row)
{
    $valor = $sheet->getCell([$col, $row])->getValue();
    return $valor === null || $valor === '' ? 0.0 : (float)$valor;
}

function procesarBloque(?array $personal, array $metricas, string $anho, bool $confirmar, PDO $pdo, array &$resumen): void
{
    if ($personal === null || empty($metricas)) {
        return;
    }

    $programadas = $metricas['programadas'] ?? array_fill(0, 12, 0.0);
    $pagadas     = $metricas['pagadas'] ?? array_fill(0, 12, 0.0);
    $permisos    = $metricas['permisos'] ?? array_fill(0, 12, 0.0);

    for ($mesIndex = 0; $mesIndex < 12; $mesIndex++) {
        $prog = $programadas[$mesIndex];
        $pag  = $pagadas[$mesIndex];
        $perm = $permisos[$mesIndex];

        if ($prog == 0 && $pag == 0 && $perm == 0) {
            continue; // mes sin datos reales, se salta
        }

        $mes = $mesIndex + 1;
        $resumen[] = [
            'personal_id' => $personal['id'],
            'personal' => $personal['apellidos'] . ', ' . $personal['nombres'],
            'anho' => $anho,
            'mes' => $mes,
            'programadas' => $prog,
            'pagadas' => $pag,
            'permisos' => $perm,
        ];

        if ($confirmar) {
            $stmt = $pdo->prepare("
                INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)
                VALUES (:personal_id, :anho, :mes, :programadas, :pagadas, :permisos)
                ON CONFLICT (personal_id, anho, mes)
                DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas,
                              horas_pagadas = EXCLUDED.horas_pagadas,
                              permisos_horas = EXCLUDED.permisos_horas
            ");
            $stmt->execute([
                ':personal_id' => $personal['id'],
                ':anho' => (int)$anho,
                ':mes' => $mes,
                ':programadas' => $prog,
                ':pagadas' => $pag,
                ':permisos' => $perm,
            ]);
        }
    }
}

// =====================================================
// Main
// =====================================================

echo $modoConfirmar ? "=== MODO CONFIRMAR (se va a escribir en la base) ===\n\n" : "=== MODO DRY-RUN (no se escribe nada) ===\n\n";

$pdo = PgsqlConnection::getInstance()->getConnection();

$stmt = $pdo->query("SELECT id, nombres, apellidos FROM personal");
$personalList = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo "Funcionarios en la base de datos:\n";
foreach ($personalList as $p) {
    echo "  [{$p['id']}] {$p['apellidos']}, {$p['nombres']}\n";
}
echo "\n";

$reader = IOFactory::createReader('Xlsx');
$reader->setReadDataOnly(true);
$spreadsheet = $reader->load(RUTA_EXCEL);

$resumen = [];
$bloquesOmitidos = [];

if ($modoConfirmar) {
    $pdo->beginTransaction();
}

try {
    foreach (HOJAS_ANIOS as $anho) {
        if (!$spreadsheet->sheetNameExists($anho)) {
            echo "AVISO: no existe la hoja '{$anho}', se salta.\n";
            continue;
        }

        $sheet = $spreadsheet->getSheetByName($anho);
        $highestRow = $sheet->getHighestRow();

        $personalActual = null;
        $nombreExcelActual = null;
        $metricas = [];

        for ($row = 1; $row <= $highestRow; $row++) {
            $colA = trim((string)$sheet->getCell([1, $row])->getValue());
            if ($colA === '') continue;

            $etiqueta = normalizarNombre($colA);

            if (in_array($etiqueta, ETIQUETAS_METRICA, true)) {
                if ($personalActual === null || $etiqueta === 'SALDO DE HORAS') continue;

                $valores = [];
                for ($col = 2; $col <= 13; $col++) {
                    $valores[] = valorCelda($sheet, $col, $row);
                }

                if ($etiqueta === 'HORAS PROGRAMADAS') $metricas['programadas'] = $valores;
                if ($etiqueta === 'HORAS PAGADAS') $metricas['pagadas'] = $valores;
                if ($etiqueta === 'PERMISOS EN HORAS') $metricas['permisos'] = $valores;
            } else {
                // Cierra el bloque anterior antes de arrancar uno nuevo
                procesarBloque($personalActual, $metricas, $anho, $modoConfirmar, $pdo, $resumen);

                $nombreExcelActual = $colA;
                $personalActual = emparejarPersonal($colA, $personalList);
                $metricas = [];

                if ($personalActual === null) {
                    $bloquesOmitidos[] = "{$anho}: '{$nombreExcelActual}' (normalizado: '" . normalizarNombre($colA) . "')";
                } else {
                    echo "Hoja {$anho}: '{$nombreExcelActual}' -> [{$personalActual['id']}] {$personalActual['apellidos']}, {$personalActual['nombres']}\n";
                }
            }
        }
        // Cierra el último bloque de la hoja
        procesarBloque($personalActual, $metricas, $anho, $modoConfirmar, $pdo, $resumen);
    }

    if ($modoConfirmar) {
        $pdo->commit();
    }
} catch (Exception $e) {
    if ($modoConfirmar) {
        $pdo->rollBack();
    }
    echo "\nERROR: " . $e->getMessage() . "\n";
    exit(1);
}

echo "\n=== Bloques omitidos (sin match en personal) ===\n";
if (empty($bloquesOmitidos)) {
    echo "  (ninguno)\n";
} else {
    foreach ($bloquesOmitidos as $b) {
        echo "  - {$b}\n";
    }
}

echo "\n=== Registros " . ($modoConfirmar ? "escritos" : "que se escribirían") . " (" . count($resumen) . ") ===\n";
foreach ($resumen as $r) {
    printf(
        "  %s | %s-%02d | programadas=%.2f pagadas=%.2f permisos=%.2f\n",
        $r['personal'], $r['anho'], $r['mes'], $r['programadas'], $r['pagadas'], $r['permisos']
    );
}

if (!$modoConfirmar) {
    $porPersona = [];
    foreach ($resumen as $r) {
        $porPersona[$r['personal_id']]['nombre'] = $r['personal'];
        $porPersona[$r['personal_id']]['filas'][] = $r;
    }
    uasort($porPersona, fn($a, $b) => strcmp($a['nombre'], $b['nombre']));

    $sql = "-- Vista previa de la importación de compensaciones desde\n";
    $sql .= "-- \"" . RUTA_EXCEL . "\"\n";
    $sql .= "-- Generado: " . date('Y-m-d H:i:s') . " -- Total de filas: " . count($resumen) . "\n";
    $sql .= "-- Revisar antes de aprobar la ejecución real (php importar-compensaciones.php --confirmar)\n\n";

    foreach ($porPersona as $personalId => $grupo) {
        $sql .= "-- =====================================================\n";
        $sql .= "-- [{$personalId}] {$grupo['nombre']} (" . count($grupo['filas']) . " registros)\n";
        $sql .= "-- =====================================================\n";
        foreach ($grupo['filas'] as $r) {
            $sql .= sprintf(
                "INSERT INTO compensaciones (personal_id, anho, mes, horas_programadas, horas_pagadas, permisos_horas)\n" .
                "VALUES (%d, %s, %d, %.2f, %.2f, %.2f)\n" .
                "ON CONFLICT (personal_id, anho, mes) DO UPDATE SET horas_programadas = EXCLUDED.horas_programadas, horas_pagadas = EXCLUDED.horas_pagadas, permisos_horas = EXCLUDED.permisos_horas;\n",
                $personalId, $r['anho'], $r['mes'], $r['programadas'], $r['pagadas'], $r['permisos']
            );
        }
        $sql .= "\n";
    }

    $rutaSalida = __DIR__ . '/import-compensaciones-preview.sql';
    file_put_contents($rutaSalida, $sql);
    echo "\nArchivo de vista previa generado en: {$rutaSalida}\n";
}

echo "\n" . ($modoConfirmar ? "Listo, cambios guardados." : "Dry-run completo. Volvé a correr con --confirmar para escribir de verdad.") . "\n";
