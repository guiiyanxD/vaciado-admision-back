<#
.SINOPSIS
    Backup de la base de datos PostgreSQL "movimiento_hospitalario_2".

.DESCRIPCION
    Genera un dump en formato custom (pg_dump -F c), lo guarda en una carpeta
    local dedicada y, si el dump es valido, copia el mismo archivo a la
    carpeta de OneDrive sincronizada como destino secundario fuera de disco.
    Registra cada corrida (exito o error) en un archivo de log.

    No requiere contrasena embebida: usa el mecanismo estandar de PostgreSQL
    (%APPDATA%\postgresql\pgpass.conf) para autenticarse sin prompt.

.NOTAS
    Pensado para ejecutarse via Windows Task Scheduler, una vez por semana.
    No borra backups viejos a proposito (retencion: conservar todo).
#>

$ErrorActionPreference = "Stop"

$pgBin      = "C:\Program Files\PostgreSQL\17\bin"
$dbName     = "movimiento_hospitalario_2"
$dbUser     = "postgres"
$dbHost     = "127.0.0.1"
$dbPort     = "5432"

$backupRoot = "C:\Backups\admision-vaciado-db"
$cloudRoot  = "C:\Users\ADMISION09\OneDrive\Backups\admision-vaciado-db"
$logFile    = Join-Path $backupRoot "backup.log"

$timestamp  = Get-Date -Format "yyyy-MM-dd_HHmmss"
$fileName   = "movimiento_hospitalario_2_$timestamp.dump"
$localPath  = Join-Path $backupRoot $fileName

function Write-Log {
    param([string]$Mensaje)
    $linea = "[{0}] {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $Mensaje
    Add-Content -Path $logFile -Value $linea
}

New-Item -ItemType Directory -Force -Path $backupRoot | Out-Null

try {
    New-Item -ItemType Directory -Force -Path $cloudRoot | Out-Null

    & "$pgBin\pg_dump.exe" -h $dbHost -p $dbPort -U $dbUser -F c -f $localPath $dbName

    if ($LASTEXITCODE -ne 0) {
        throw "pg_dump devolvio codigo de salida $LASTEXITCODE"
    }

    if (-not (Test-Path $localPath) -or (Get-Item $localPath).Length -eq 0) {
        throw "El archivo de backup no se genero o quedo vacio"
    }

    $tamanoMB = [math]::Round((Get-Item $localPath).Length / 1MB, 2)

    Copy-Item -Path $localPath -Destination $cloudRoot -Force

    Write-Log "OK - $fileName ($tamanoMB MB) - copiado tambien a OneDrive"
}
catch {
    Write-Log "ERROR - $($_.Exception.Message)"
    exit 1
}
