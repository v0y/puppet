class virtual::account::system {
  @account::system {
    'lolwtf.pl':
      uid       => 5000,
      gid       => 5000,
      shell     => '/bin/false',
      home      => '/var/www/lolwtf.pl',
      home_mode => '0751',
      groups    => [ 'ssh', 'users', 'uwsgi', 'virtualenv', 'webroot', 'deployer' ]
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
  @account::system {
    'polski-bus.lolwtf.pl':
      uid       => 5012,
      gid       => 5012,
      shell     => '/bin/false',
      home      => '/var/www/polski-bus.lolwtf.pl',
      home_mode => '0751',
      groups    => [ 'ssh', 'users', 'uwsgi', 'virtualenv', 'webroot', 'deployer' ]
  }
  @account::system {
    'git':
      uid       => 5013,
      gid       => 5013,
      shell     => '/bin/bash',
      home      => '/home/git',
      home_mode => '0751',
      groups    => [ 'ssh', 'users' ]
  }
}
