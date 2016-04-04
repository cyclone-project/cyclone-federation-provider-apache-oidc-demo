FROM debian

RUN apt-get update && apt-get -y install apache2.2-common nano wget php5 libapache2-mod-php5

RUN wget --quiet --output-document=/tmp/oidc.deb https://github.com/pingidentity/mod_auth_openidc/releases/download/v1.8.8/libapache2-mod-auth-openidc_1.8.8-1_amd64.deb ; dpkg -i /tmp/oidc.deb ; apt-get install -fy && dpkg -i /tmp/oidc.deb

RUN a2enmod auth_openidc php5 ssl authz_groupfile

COPY ./html /var/www/html

COPY ./apache.* /etc/apache2/ssl/
RUN chown www-data:www-data /etc/apache2/ssl/*
RUN chmod 440 /etc/apache2/ssl/*

CMD apache2ctl -D FOREGROUND

EXPOSE 80
EXPOSE 443

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
