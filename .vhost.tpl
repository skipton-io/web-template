<VirtualHost *:80>
    DocumentRoot /var/www/html
    
    ModPagespeedHonorCsp                    on
    ModPagespeedCriticalImagesBeaconEnabled true
    ModPagespeedFileCachePath               "/var/www/cache/pagespeed"
    ModPagespeedFileCacheSizeKb             102400
    ModPagespeedFileCacheCleanIntervalMs    3600000
    ModPagespeedFileCacheInodeLimit         500000
    ModPagespeedInPlaceResourceOptimization on

    <Directory /var/www/html>
        AllowOverride None
        Order Allow,Deny
        Allow from All

        Header always set X-Frame-Options "DENY"
        Header always set X-Xss-Protection "1; mode=block"
        Header always set X-Content-Type-Options "nosniff"
        Header always set Referrer-Policy "no-referrer-when-downgrade"
        Header always set Content-Security-Policy "default-src 'none'; script-src 'self' data:; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' fonts.googleapis.com; img-src 'self' data:; connect-src 'self'; manifest-src 'self'"
        Header always set X-Content-Security-Policy "default-src 'none'; script-src 'self' data:; font-src 'self' fonts.gstatic.com fonts.googleapis.com; style-src 'self' fonts.googleapis.com; img-src 'self' data:; connect-src 'self'; manifest-src 'self'"

        ModPagespeed On
        ModPagespeedAllow all
        AddOutputFilterByType MOD_PAGESPEED_OUTPUT_FILTER text/html
        ModPagespeedEnableFilters convert_meta_tags,resize_rendered_image_dimensions,responsive_images,resize_mobile_images,inline_preview_images,collapse_whitespace,resize_rendered_image_dimensions,rewrite_images,outline_javascript,outline_css,trim_urls,combine_css,combine_javascript,rewrite_css,rewrite_style_attributes_with_url,rewrite_style_attributes,fallback_rewrite_css_urls,defer_javascript

    
    </Directory>


    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>
