FROM php:apache

VOLUME /var/www/cache/pagespeed

WORKDIR /tmp

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
RUN apt update \
    && apt-get update \
    && apt install -y gnupg2 ca-certificates
    
RUN curl -o /tmp/linux_signing_key.pub https://dl-ssl.google.com/linux/linux_signing_key.pub
RUN apt-key add /tmp/linux_signing_key.pub
RUN curl -o /tmp/mod-pagespeed.deb  https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb \
    && dpkg -i /tmp/mod-pagespeed.deb \
    && apt-get -f install
    
RUN a2enmod headers

# VHOST(S)
COPY .vhost.tpl /var/www/
RUN cp /var/www/.vhost.tpl /etc/apache2/sites-enabled/000-default.conf
RUN apache2ctl configtest

WORKDIR /var/www

RUN chmod 0777 /var/www/cache -R
