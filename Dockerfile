FROM php:8.2-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip\
    openssl\
    cron\
    nano\
    yaz\
    libyaz-dev


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install yaz extensions
RUN pecl install --force yaz
RUN docker-php-ext-enable yaz

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd

# Enable PHP extensions
RUN docker-php-ext-enable pdo_mysql mysqli mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

USER $user

COPY . .

RUN echo "* */1 * * * php /var/www/artisan apply:fine >> /dev/null 2>&1" | crontab -

