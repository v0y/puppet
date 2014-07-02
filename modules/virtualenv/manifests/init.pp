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
}
