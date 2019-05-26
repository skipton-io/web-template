<VirtualHost *:80>
    DocumentRoot /var/www/html
    
    ModPagespeedMapRewriteDomain https://d184e6uj31eqpt.cloudfront.net www.skipton.one
   
    <Directory /var/www/html>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        Header always set X-Frame-Options "DENY"
        Header always set X-Xss-Protection "1; mode=block"
        Header always set X-Content-Type-Options "nosniff"
        Header always set Referrer-Policy "no-referrer-when-downgrade"

        ModPagespeed On
        ModPagespeedAllow all
        ModPagespeedEnableFilters rewrite_domains
        ModPagespeedDomain www.skipton.one
        ModPagespeedDomain https://d184e6uj31eqpt.cloudfront.net
        AddOutputFilterByType MOD_PAGESPEED_OUTPUT_FILTER text/html
        ModPagespeedEnableFilters combine_javascript,extend_cache,resize_rendered_image_dimensions,responsive_images,trim_urls
        ModPagespeedFileCachePath            "/var/www/html/cache/pagespeed"
        ModPagespeedFileCacheSizeKb          102400
        ModPagespeedFileCacheCleanIntervalMs 3600000
        ModPagespeedFileCacheInodeLimit      500000
     
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
