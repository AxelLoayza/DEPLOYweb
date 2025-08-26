#!/bin/bash
set -e

echo "🔑 Generating app key..."
php artisan key:generate --force

echo "🧬 Running migrations..."
php artisan migrate --force

echo "⚙️ Caching config..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "🚀 Starting Apache..."
exec apache2-foreground
