class virtual::account::system {
  @account::system {
    'lolwtf.pl':
    uid       => 5000,
    gid       => 5000,
    shell     => '/bin/false',
    home      => '/var/www/lolwtf.pl',
    home_mode => '0751',
    groups    => [ 'ssh', 'users', 'uwsgi', 'virtualenv', 'webroot' ]
  }
  @account::system {
    'deployer':
      uid       => 5001,
      gid       => 5001,
      shell     => '/bin/bash',
      home      => '/home/deployer',
      home_mode => '0751',
      groups    => [ 'ssh', 'users', 'uwsgi', 'webroot', 'virtualenv' ]
  }
}
