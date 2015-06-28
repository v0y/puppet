[uwsgi]
master = true
chdir = /var/lib/uwsgi/hotele.lolwtf.pl/production
module = wsgi:application
virtualenv = /var/lib/virtualenv/hotele.lolwtf.pl/production
uwsgi-socket = /var/run/uwsgi/app/hotele.lolwtf.pl/socket
workers = 1
uid = hotele.lolwtf.pl
gid = uwsgi
env = DJANGO_SETTINGS_MODULE=polski_bus.settings
log-prefix = uwsgi-hotele.lolwtf.pl
log-5xx
log-4xx
socket = /tmp/uwsgi.hotele.lolwtf.pl.sock
max-requests = 5000
chmod-socket = 666
touch-reload = /var/lib/uwsgi/hotele.lolwtf.pl/production/wsgi.py
logfile-chown = hotele.lolwtf.pl
logfile-chmod = 660
log-slow = 2000
