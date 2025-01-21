FROM php:8.0.2-fpm
LABEL authors="Hugo | Thoma | Florent"
EXPOSE 80
# Install dependencies
RUN apt-get update && apt-get install -y \
    git-all \
    curl
WORKDIR /var/www/html
RUN rm index.html
RUN git clone https://github.com/MagnusDot/TP-Final-3IW-ESGI.git

#Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#RUN composer install

#RUN git mv .env.example .env

