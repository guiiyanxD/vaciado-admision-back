# Restaurar la base de datos desde un backup

Los backups se generan con `pg_dump -F c` (formato *custom*, comprimido) y se
restauran con `pg_restore`. Los archivos `.dump` viven en:

- Local: `C:\Backups\admision-vaciado-db\`
- Copia secundaria: `C:\Users\ADMISION09\OneDrive\Backups\admision-vaciado-db\`

Usa siempre el backup más reciente salvo que necesites un punto en el tiempo
específico.

## Escenario 1 — Restaurar sobre la base existente

Reemplaza los datos actuales de `movimiento_hospitalario_2` por los del backup
(por ejemplo, para deshacer una corrupción o un error de carga masiva):

```powershell
& "C:\Program Files\PostgreSQL\17\bin\pg_restore.exe" `
    -h 127.0.0.1 -p 5432 -U postgres `
    -d movimiento_hospitalario_2 `
    --clean --if-exists `
    "C:\Backups\admision-vaciado-db\<archivo>.dump"
```

`--clean --if-exists` borra las tablas/objetos existentes antes de recrearlos
desde el backup, sin fallar si alguno ya no existe.

## Escenario 2 — Recuperación total (base nueva, disco/equipo perdido)

Si hay que reconstruir todo desde cero en una instalación nueva de PostgreSQL:

```powershell
& "C:\Program Files\PostgreSQL\17\bin\createdb.exe" -h 127.0.0.1 -U postgres movimiento_hospitalario_2

& "C:\Program Files\PostgreSQL\17\bin\pg_restore.exe" `
    -h 127.0.0.1 -p 5432 -U postgres `
    -d movimiento_hospitalario_2 `
    "C:\Backups\admision-vaciado-db\<archivo>.dump"
```

## Recomendación

No confíes en un backup solo porque el script dijo "OK". Cada tanto (por
ejemplo, una vez al mes), probá una restauración real contra una base
temporal para confirmar que el archivo efectivamente es restaurable:

```powershell
& "C:\Program Files\PostgreSQL\17\bin\createdb.exe" -h 127.0.0.1 -U postgres admision_test_restore
& "C:\Program Files\PostgreSQL\17\bin\pg_restore.exe" -h 127.0.0.1 -U postgres -d admision_test_restore "<archivo>.dump"
# revisar que las tablas y conteos de filas tengan sentido
& "C:\Program Files\PostgreSQL\17\bin\dropdb.exe" -h 127.0.0.1 -U postgres admision_test_restore
```
