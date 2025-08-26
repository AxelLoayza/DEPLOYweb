#!/bin/bash
set -e

# Generar key si no existe
php artisan key:generate --force

# Ejecutar migraciones
php artisan migrate --force

# Limpiar y cachear configuraciones
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Configurar permisos de almacenamiento
chown -R www-data:www-data storage bootstrap/cache

# Iniciar Apache en primer plano
apache2-foreground