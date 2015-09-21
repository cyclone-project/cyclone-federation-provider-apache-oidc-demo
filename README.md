# OpenID-Connect example with Apache2 and the Cyclone Federation Provider

How to run:
```shell

# Build with (docker)[https://www.docker.com]
docker build -t cyclone/apache2 .

# Run 
docker run -it -p 8080:80 --name cyclone-apache2 cyclone/apache2
```

Visit `http://localhost:8080` and `http://localhost:8080/info.php` to make sure the server and php is configured correctly.

Visit `http://localhost/example/` for the openid-connect example.

OIDCRemoteUserClaim setting can be used to specify which claim to use to set REMOTE_USER in apache2.
