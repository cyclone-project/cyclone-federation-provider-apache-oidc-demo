# OpenID-Connect example with Apache2, SSL and the Cyclone Federation Provider

How to run:
```shell


# Build with (docker)[https://www.docker.com]
docker build -t cyclone/apache2:ssl .

# Run 
docker run -d -p 443:443 -p 80:80 -e HOSTIP=$(hostname -i) cyclone/apache2:ssl

# Stopping and removing ALL container
docker rm -f $(docker ps -aq)


```

Visit `https://localhost` and `https://localhost/info.php` to make sure the server and php is configured correctly.

Visit `https://localhost/example/` for the openid-connect example.

OIDCRemoteUserClaim setting can be used to specify which claim to use to set REMOTE_USER in apache2.
