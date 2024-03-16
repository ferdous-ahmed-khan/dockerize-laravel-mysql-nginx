# Docker Configuration for Laravel, Nginx and MySQL

This is a simple Docker configuration for running Laravel applications with Nginx and MySQL. It utilizes PHP 8.2, MySQL 8 and Nginx alpine.
<br>
<br>
## Usage

1. Clone this repository and copy all the files to your Laravel project.
2. Check your `.env` file and update the database configuration, including adding `APP_PORT`, which is the port where the application will be running. Ensure you have `DB_DATABASE`, `DB_PASSWORD`, and `DB_HOST=127.0.0.1` set to any string value.

    Example `.env` configuration:
    ```env
    APP_PORT=7000
    DB_CONNECTION=mysql
    DB_HOST=mysql_db_host
    DB_DATABASE=laravel
    DB_USERNAME=root
    DB_PASSWORD=root
    ```

3. Start your Docker or Docker Desktop application.
4. Run `docker-compose build` to build the images.
5. Run `docker-compose up -d` to start the containers.
<br>
<br>
## Interacting with Containers

To interact with the container, use the following command:

```bash
docker exec -it laravel_application bash
```
<br>
<br>
## Database Client

You can use Adminer to interact with the database. It can be accessed via the following URL:

```json
http://localhost:{APP_PORT}/adminer.php
```

Adminer is located in the public folder of your Laravel project.

<br>
<br>
## For Laravel 11

If you're using Laravel 11, please ensure the database configuration in the `.env` file is correct. Laravel 11 uses SQLite as the default database. You need to change it to MySQL and migrate the database.

Interact with the container and run the following command to migrate the database:

```bash
docker exec -it laravel_application bash
php artisan migrate
```
<br>
<br>
## This Dockerfile includes the following services:

- **PHP 8.2**: The base image for PHP 8.2 with FPM (FastCGI Process Manager).
- **Git**: Version control system for tracking changes in the project.
- **cURL**: Command-line tool for transferring data with URLs.
- **libpng-dev**: Development files for the libpng library (for PNG image support).
- **libonig-dev**: Development files for the Oniguruma regular expression library.
- **libxml2-dev**: Development files for the libxml2 library (for XML support).
- **zip**: Compression utility for creating and modifying zip archives.
- **unzip**: Utility for unpacking zip archives.
- **openssl**: Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.
- **cron**: Utility for running scheduled tasks.
- **nano**: Text editor for modifying files within the container.
- **yaz**: Library for building Z39.50/SRW/SRU clients/servers.
- **libyaz-dev**: Development files for the yaz library.
- **Composer**: Dependency manager for PHP used to install PHP packages.


 <br>
This Dockerfile sets up the PHP environment with necessary extensions and tools for running Laravel applications. Additionally, it configures a system user to run Composer and Artisan commands, and sets up a cron job for running scheduled tasks.
