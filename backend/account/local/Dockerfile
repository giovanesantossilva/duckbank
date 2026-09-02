ARG PHP_VERSION=8.4
FROM php:${PHP_VERSION}-cli
# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libzip-dev
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_pgsql
RUN rm -rf /var/lib/apt/lists/*
# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
WORKDIR /var/www/code
EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
