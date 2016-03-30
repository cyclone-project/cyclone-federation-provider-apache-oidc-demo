FROM debian

RUN apt-get update && apt-get -y install apache2.2-common libapache2-mod-auth-openidc nano wget php5 libapache2-mod-php5

RUN a2enmod auth_openidc php5 ssl

COPY ./html /var/www/html
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./apache.* /etc/apache2/ssl/
RUN chown www-data:www-data /etc/apache2/ssl/*
RUN chmod 440 /etc/apache2/ssl/*

CMD apache2ctl -D FOREGROUND

EXPOSE 80
EXPOSE 443
