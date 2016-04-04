# OpenID-Connect example with Apache2, SSL and the Cyclone Federation Provider

## How to run:

```shell


# Build with (docker)[https://www.docker.com]
docker build -t cyclone/apache2:ssl .

# Run on localhost
docker run -it -p 443:443 -p 80:80 -e HOSTIP=localhost cyclone/apache2:ssl

# Run on a distant server
docker run -d -p 443:443 -p 80:80 -e HOSTIP=$(hostname -i) cyclone/apache2:ssl

# Stopping and removing ALL container
docker rm -f $(docker ps -aq)


```

Visit `https://localhost` and `https://localhost/info.php` to make sure the server and php is configured correctly.

Visit `https://localhost/example/` for the openid-connect example.

OIDCRemoteUserClaim setting can be used to specify which claim to use to set REMOTE_USER in apache2.

## User filtering

See in [000-default.conf](000-default.conf) that the config is different for 443 and 80. On port 443 we only allow edugain user with an email ending with `u-psud.fr` or `france-bioinformatique.fr` or users listed in /etc/apache2/apache_groups


## Known problem

If you encounter an error 100 during the build with the apt-get update, it can means that you are behind a firewall that is blocking some dns resolution. To fix it, use your in-house dns like this :


```shell

# Build with (docker)[https://www.docker.com] behind a firewall
docker --dns 157.136.10.1 --dns 157.136.10.2 build -t cyclone/apache2:ssl .

```
