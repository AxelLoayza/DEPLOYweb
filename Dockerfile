FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    libpng-dev \
    libzip-dev

# Install and enable MySQL PDO
RUN docker-php-ext-install pdo_mysql zip

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-dev --optimize-autoloader

RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80

CMD ["apache2-foreground"]