cd 
cd mapareports

sudo chown bitnami:daemon -R storage bootstrap/cache
sudo find storage bootstrap/cache -type f -exec chmod 664 {} \; 
sudo find storage bootstrap/cache -type d -exec chmod 775 {} \;

cat <<EOF > /opt/bitnami/apache/conf/vhosts/laravel-vhost.conf
<VirtualHost *:80>
  DocumentRoot "/home/bitnami/mapareports/public"
  DirectoryIndex index.php
  <Directory "/home/bitnami/mapareports/public">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
  </Directory>
</VirtualHost>
EOF

sudo service bitnami restart
