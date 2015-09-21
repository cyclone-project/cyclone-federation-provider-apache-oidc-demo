FROM debian

RUN apt-get update

RUN apt-get -y install apache2.2-common libapache2-mod-auth-openidc nano wget php5 libapache2-mod-php5

RUN a2enmod auth_openidc php5

COPY ./html /var/www/html
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

CMD apache2ctl -D FOREGROUND

EXPOSE 80
