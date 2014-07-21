class virtualenv {

  package { 'python2.7':
    ensure    => installed
  }
  package { 'python2.7-dev':
    ensure    => installed
  }
  package { 'python-virtualenv':
    ensure => installed
  }

  file {
    '/var/lib/virtualenv':
      ensure  => directory,
      mode    => '0664',
      group   => 'virtualenv',
  }
}
