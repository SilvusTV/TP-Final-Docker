FROM php:8.1-fpm
ARG ID
COPY app /var/www/html
COPY start.sh /usr/local/bin/start.sh
COPY Resources/welcome-server"$ID".blade.php /var/www/html/resources/views/welcome.blade.php

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    nodejs \
    npm \
    && docker-php-ext-install pdo pdo_mysql
# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chmod +x /usr/local/bin/start.sh

WORKDIR /var/www/html


CMD ["/usr/local/bin/start.sh"]