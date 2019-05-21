FROM httpd:2.4

VOLUME /usr/local/apache2/htdocs

RUN addgroup --gid 65536 deploygroup && \
    adduser --disabled-password --gecos ""  --ingroup deploygroup deployuser && \
    chgrp deploygroup /usr/local/apache2/htdocs -R && \
    chown deployuser /usr/local/apache2/htdocs -R && \
    sed -i 's/${APACHE_RUN_USER:=www-data}/${APACHE_RUN_USER:=deployuser}/g' /etc/apache2/envvars && \
    sed -i 's/${APACHE_RUN_GROUP:=www-data}/${APACHE_RUN_GROUP:=deploygroup}/g' /etc/apache2/envvars


