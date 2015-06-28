server {
  access_log /var/log/nginx/x_access.log;
  error_log /var/log/nginx/x_error.log;

  listen 80;
  server_name hotele.lolwtf.pl;
  root /var/www/hotele.lolwtf.pl/public;
  client_max_body_size 10M;

  location ~ /(404|50[0-5]).html {
    root /var/www/error_pages;
  }

  if ($http_host != "hotele.lolwtf.pl") {
    rewrite ^ http://hotele.lolwtf.pl;
  }

  rewrite ^(/media/.*)/$ $1 permanent;

  location /static {
    alias /var/www/hotele.lolwtf.pl/public/static;
  }

  location /media {
    alias /var/www/hotele.lolwtf.pl/public/media;
  }

  location / {
    include uwsgi_params;
    uwsgi_pass unix:/var/run/uwsgi/app/hotele.lolwtf.pl/socket;
  }
}
