echo "Starting the container"
chmod -R 777 /var/www/html/storage

echo "En attente de MySQL..."
while ! nc -z db 3306; do
    sleep 2
done

composer install
npm install
npm run build
php artisan key:generate
php artisan migrate:fresh --seed
php-fpm