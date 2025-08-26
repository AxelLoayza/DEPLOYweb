#!/bin/bash

# Generar key si no existe
php artisan key:generate --force

# Ejecutar migraciones
php artisan migrate --force



# Configurar permisos de almacenamiento
chown -R www-data:www-data storage bootstrap/cache

# Iniciar Apache en primer plano
apache2-foreground