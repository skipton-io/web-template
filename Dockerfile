FROM php:apache

WORKDIR /tmp
RUN  curl -o /tmp/mod-pagespeed.deb  https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb \
    && dpkg -i /tmp/mod-pagespeed.deb \
    && apt-get -f install
    
RUN a2enmod headers
