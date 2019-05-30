FROM php:apache

VOLUME /var/www/cache/pagespeed

WORKDIR /tmp
RUN  curl -o /tmp/mod-pagespeed.deb  https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb \
    && dpkg -i /tmp/mod-pagespeed.deb \
    && apt-get -f install
    
RUN a2enmod headers

# VHOST(S)
COPY .vhost.tpl /var/www/
RUN cp /var/www/.vhost.tpl /etc/apache2/sites-enabled/000-default.conf
RUN apache2ctl configtest

WORKDIR /var/www
