class virtual::account::system {
  @account::system {
    'lolwtf.pl':
    uid       => 5000,
    gid       => 5000,
    shell     => '/bin/false',
    home      => '/var/www/lolwtf.pl',
    home_mode => '0751',
    groups    => [ 'uwsgi', 'webroot', 'virtualenv' ]
  }
}
