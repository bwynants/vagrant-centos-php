<html>
   <head>
   </head>
   <body>
      <h1>Welcome to the vagrant host.</h1>
      <h2>apache</h2>
      <pre>
      <?php print_r(apache_get_modules());?>
      </pre>
      <h2>php info</h2>
      <pre>
      <?php phpinfo(-1); ?>
      </pre>
   </body>
</html>
