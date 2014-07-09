class uwsgi {
  Account::System <| title == 'uwsgi' |>

  package {
    [ 'uwsgi', 'uwsgi-core', 'uwsgi-plugin-python' ]:
      ensure => installed
  }

  file {
    '/var/run/uwsgi':
      ensure  => directory,
      mode    => '0751',
      group   => 'uwsgi',
      require => Package['uwsgi-plugin-python']
  }

  service {
    'uwsgi':
      ensure    => running,
      hasstatus => true,
      status    => "/etc/init.d/uwsgi status $project",
  }
}
