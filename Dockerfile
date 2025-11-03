# --------------------------------------------------------------------
# ETAPA 1: BUILDER (Composer)
# Usa la imagen de Composer para instalar dependencias de PHP
# --------------------------------------------------------------------
FROM composer:2.7 AS builder

# Instalar dependencias del sistema para la compilación de PHP (libpq-dev)
# Nota: Utilizamos apt-get porque la imagen base de composer lo usa
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos de configuracion de dependencias
COPY composer.json composer.lock ./

# Instalar las dependencias de produccion
RUN composer install \
    --prefer-dist \
    --no-dev \
    --no-scripts \
    --optimize-autoloader

# Copiar el resto del codigo fuente de la aplicacion
COPY . .

# --------------------------------------------------------------------
# ETAPA 2: PRODUCCIÓN (RUNTIME CON NGINX Y PHP-FPM)
# Usamos php:8.2-fpm-alpine que es ligero para el runtime
# --------------------------------------------------------------------
FROM php:8.2-fpm-alpine

# Instalar Nginx y las extensiones de PHP necesarias
RUN apk add --no-cache nginx postgresql-dev \
    # Compila e instala las extensiones pdo y pdo_pgsql
    && docker-php-ext-install pdo pdo_pgsql opcache \
    # Limpia el cache de paquetes
    && rm -rf /var/cache/apk/*

# Copiar el archivo de configuracion de Nginx (definido a continuacion)
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar archivos de la aplicacion y dependencias resueltas de la etapa 'builder'
COPY --from=builder /app /app

# Configurar PHP-FPM para que escuche en el puerto 9000 (accesible por Nginx)
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /usr/local/etc/php-fpm.d/zz-docker.conf

# Cloud Run requiere que se exponga el puerto de escucha (8080)
EXPOSE 8080

# Comando de ejecucion: Inicia PHP-FPM en segundo plano (-D) y Nginx en primer plano.
# Nginx escuchara en 8080 (el puerto de Cloud Run) y reenviara a FPM en 9000.
CMD sh -c "php-fpm -D && nginx -g 'daemon off;'"