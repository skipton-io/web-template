FROM debian:jessie

RUN apt-get update && \
    apt-get install apt-utils -y && \
    apt-get dist-upgrade -y && \
    apt-get upgrade -y
    
RUN apt-get install wget apache2 -y

RUN wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb && \
    dpkg -i mod-pagespeed-*.deb && \
    apt-get -f install
    
WORKDIR /tmp
COPY entrypoint.sh .
ENTRYPOINT /tmp/entrypoint.sh
RUN ["chmod", "+x", "/tmp/entrypoint.sh"]

