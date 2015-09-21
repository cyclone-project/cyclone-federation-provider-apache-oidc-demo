<html>
  <body>
    <h1>Hello, <?php echo($_SERVER['REMOTE_USER']) ?></h1>
    <pre><?php print_r(apache_request_headers()); ?></pre>
    <a href="/example/redirect_uri?logout=http%3A%2F%2Flocalhost%3A8080%2F">Logout</a>
  </body>
</html>
