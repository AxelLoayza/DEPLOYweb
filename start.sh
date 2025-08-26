#!/bin/bash

# Generar key si no existe
php artisan key:generate --force

# Migraciones
php artisan migrate --force

# Optimizaciones
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Iniciar Apache
apache2-foreground