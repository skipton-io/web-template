FROM debian:jessie

RUN apt-get update && \
    apt-get install apt-utils -y && \
    apt-get dist-upgrade -y && \
    apt autoremove -y && \
    apt-get upgrade -y && \
    apt-get install wget apache2 -y

RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-beta_current_amd64.deb && \
    dpkg -i mod-pagespeed-*.deb && \
    apt-get -f install
    
