class virtual::account::human {
  @account::human {
    'voy':
    uid       => 1001,
    gid       => 1001,
    shell     => '/bin/bash',
    home      => '/home/voy',
    home_mode => '0751',
    groups    => [ 'uwsgi', 'webroot', 'virtualenv', 'ssh', 'users' ]
  }
}
