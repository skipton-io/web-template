<VirtualHost *:80>
    DocumentRoot /var/www/html
    
    ModPagespeedFileCachePath            "/var/www/cache/pagespeed"
    ModPagespeedFileCacheSizeKb          102400
    ModPagespeedFileCacheCleanIntervalMs 3600000
    ModPagespeedFileCacheInodeLimit      500000
    
    <Directory /var/www/html>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        Header always set X-Frame-Options "DENY"
        Header always set X-Xss-Protection "1; mode=block"
        Header always set X-Content-Type-Options "nosniff"
        Header always set Referrer-Policy "no-referrer-when-downgrade"
        Header always set Content-Security-Policy "default-src 'none'; script-src 'self' 'sha256-tS4rlf9auePv8dyhzQV4k0I4sRlI7yhY2lFd4rywFx4=' 'sha256-8byN4etKmPaEf5HsqwI8lAS7xh3Ct0YARDAW71eubm8='; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' 'unsafe-inline' fonts.googleapis.com; img-src 'self'; connect-src 'self'"
        Header always set X-Content-Security-Policy "default-src 'none'; script-src 'self' 'sha256-tS4rlf9auePv8dyhzQV4k0I4sRlI7yhY2lFd4rywFx4=' 'sha256-8byN4etKmPaEf5HsqwI8lAS7xh3Ct0YARDAW71eubm8='; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' 'unsafe-inline' fonts.googleapis.com; img-src 'self'; connect-src 'self'"

        ModPagespeed On
        ModPagespeedAllow all
        AddOutputFilterByType MOD_PAGESPEED_OUTPUT_FILTER text/html
        ModPagespeedEnableFilters combine_javascript,extend_cache,resize_rendered_image_dimensions,responsive_images
    
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
