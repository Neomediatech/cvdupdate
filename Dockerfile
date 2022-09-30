FROM neomediatech/php:apache

ENV CVDUPDATE_VERSION=1.1.1 \
    SERVICE=cvdupdate

LABEL maintainer="docker-dario@neomediatech.it" \
      org.label-schema.version=$CVDUPDATE_VERSION \
      org.label-schema.vcs-type=Git \
      org.label-schema.vcs-url=https://github.com/Neomediatech/${SERVICE} \
      org.label-schema.maintainer=Neomediatech

RUN apt-get update && apt-get -y dist-upgrade && \
    apt-get install -y --no-install-recommends python3-pip && \
    rm -rf /var/lib/apt/lists*

RUN sed -i 's#/var/www:#/var/www/html:#' /etc/passwd

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

USER www-data 

RUN python3 -m pip install --user cvdupdate

RUN python3 -m cvdupdate config set && \
    python3 -m cvdupdate config set --dbdir /var/www/html

#python3 -m cvdupdate config set --dbdir /var/www/html
#python3 -m cvdupdate config set --logdir /logs

#python3 -m cvdupdate update

#python3 -m cvdupdate --help

#python3 -m pip install --user cvdupdate

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]

