chmod -R 777 /storage
composer install
npm install
npm run build
php artisan key:generate
php artisan migrate:fresh --seed
php-fpm
