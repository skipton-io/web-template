FROM httpd:2.4

VOLUME /usr/local/apache2/htdocs

RUN apt-get update && \
    apt-get install apt-utils -y && \
    apt-get dist-upgrade -y && \
    apt autoremove -y && \
    apt-get upgrade -y && \
    dpkg -i mod-pagespeed-*.deb && \
    apt-get -f install
    
