FROM debian

RUN apt-get update && apt-get -y install \
		apache2.2-common \
		nano \
		wget \
		php5 \
		libapache2-mod-php5 \
		libjansson4 \
		libcurl3 \
		libhiredis0.10

RUN    wget --quiet --output-document=/tmp/oidc.deb https://github.com/pingidentity/mod_auth_openidc/releases/download/v2.0.0/libapache2-mod-auth-openidc_2.0.0-1_amd64.deb \
    && wget --quiet --output-document=/tmp/libcjose.deb https://github.com/pingidentity/mod_auth_openidc/releases/download/v2.0.0/libcjose_0.4.1-1_amd64.deb \
    && dpkg -i /tmp/oidc.deb /tmp/libcjose.deb \
	&& rm -f /tmp/oidc.deb /tmp/libcjose.deb \
	&& rm -rf /var/lib/apt/lists/*

RUN a2enmod auth_openidc php5 ssl authz_groupfile

COPY ./html /var/www/html

COPY ./apache.* /etc/apache2/ssl/
RUN chown www-data:www-data /etc/apache2/ssl/*
RUN chmod 440 /etc/apache2/ssl/*

CMD apache2ctl -D FOREGROUND

EXPOSE 80
EXPOSE 443
EXPOSE 8443

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

COPY ./apache_groups /etc/apache2/apache_groups
