# Dockerfile
FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    unzip libpng-dev libjpeg-dev libmcrypt-dev mariadb-client git \
    && docker-php-ext-install pdo pdo_mysql mysqli gd

# Download GLPI
RUN curl -L -o /tmp/glpi.tgz https://github.com/glpi-project/glpi/releases/download/10.0.10/glpi-10.0.10.tgz && \
    tar -xzf /tmp/glpi.tgz -C /var/www/html/ && \
    rm -rf /tmp/glpi.tgz

RUN chown -R www-data:www-data /var/www/html/glpi

EXPOSE 80

