<VirtualHost *:80>
    DocumentRoot /var/www/html
    
    ModPagespeedHonorCsp                    on
    ModPagespeedCriticalImagesBeaconEnabled true
    ModPagespeedFileCachePath               "/var/www/cache/pagespeed"
    ModPagespeedFileCacheSizeKb             102400
    ModPagespeedFileCacheCleanIntervalMs    1576800000000
    ModPagespeedFileCacheInodeLimit         500000
    ModPagespeedInPlaceResourceOptimization on
    ModPagespeedCssOutlineMinBytes          1
    ModPagespeedJsOutlineMinBytes           1
    ModPagespeedImageRecompressionQuality   95


    <Directory /var/www/html>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        Header always set X-Frame-Options "DENY"
        Header always set X-Xss-Protection "1; mode=block"
        Header always set X-Content-Type-Options "nosniff"
        Header always set Referrer-Policy "no-referrer-when-downgrade"
        Header always set Content-Security-Policy "default-src 'none'; script-src 'self' data: 'unsafe-inline'; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' fonts.googleapis.com 'unsafe-inline'; img-src 'self' data:; connect-src 'self'; manifest-src 'self'"
        Header always set X-Content-Security-Policy "default-src 'none'; script-src 'self' data: 'unsafe-inline'; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' fonts.googleapis.com 'unsafe-inline'; img-src 'self' data:; connect-src 'self'; manifest-src 'self'"

        ModPagespeed On
        ModPagespeedAllow all
        AddOutputFilterByType MOD_PAGESPEED_OUTPUT_FILTER text/html
        ModPagespeedEnableFilters prioritize_critical_css,rewrite_images,responsive_images,resize_mobile_images,inline_preview_images,outline_javascript,outline_css,rewrite_css,rewrite_style_attributes_with_url,rewrite_style_attributes,fallback_rewrite_css_urls,trim_urls

    
    </Directory>


    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
