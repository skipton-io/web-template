<VirtualHost *:80>
    DocumentRoot /var/www/html

    <Directory /var/www/html>
    AllowOverride None
    Order Allow,Deny
    Allow from All
    
    <IfModule mod_rewrite.c>
        Options -MultiViews
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ index.php [QSA,L]
    </IfModule>
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
    Header always set X-Frame-Options "DENY"
    Header always set X-Xss-Protection "1; mode=block"
    Header always set X-Content-Type-Options "nosniff"
    Header always set Referrer-Policy "no-referrer-when-downgrade"
    Header always set Content-Security-Policy "default-src 'self'"
    Header always set X-Content-Security-Policy "default-src 'self'"
</VirtualHost>
