cd
composer create-project laravel/laravel mapareports
cd mapareports
composer require jeroennoten/laravel-adminlte
composer require laravel/ui
php artisan ui vue --auth
npm install && npm run dev
php artisan adminlte:install --force --type=full
php artisan adminlte:install --force --only=main_views
php artisan adminlte:plugins install
cd
