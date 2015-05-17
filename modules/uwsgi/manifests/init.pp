class uwsgi {
  Account::System <| title == 'uwsgi' |>

  package {
    [ 'uwsgi', 'uwsgi-core', 'uwsgi-plugin-python', 'uwsgi-plugin-python3' ]:
      ensure => installed
  }

  file {
    '/var/run/uwsgi':
      ensure  => directory,
      mode    => '0751',
      group   => 'uwsgi',
      require => Package['uwsgi-plugin-python', 'uwsgi-plugin-python3']
  }

  service {
    'uwsgi':
      ensure    => running,
      hasstatus => true,
      status    => "/etc/init.d/uwsgi status $project",
  }

  file { "/var/lib/uwsgi":
    ensure   => directory,
    owner    => 'root',
    group    => 'uwsgi',
    mode     => '0770'
  }
}
