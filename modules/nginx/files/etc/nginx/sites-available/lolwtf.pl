server {
  access_log /var/log/nginx/x_access.log;
  error_log /var/log/nginx/x_error.log;

  listen 80;
  server_name lolwtf.pl;
  root /var/www/lolwtf.pl/public;
  client_max_body_size 10M;

  location ~ /(404|50[0-5]).html {
    root /var/www/error_pages;
  }

  if ($http_host != "lolwtf.pl") {
    rewrite ^ http://lolwtf.pl;
  }

  location /static {
    root /var/www/lolwtf.pl/public;
  }

  location /media {
    root /var/www/lolwtf.pl/public;
  }

  location / {
    include uwsgi_params;
    uwsgi_pass unix:/var/run/uwsgi/app/lolwtf.pl/socket;
  }
}
