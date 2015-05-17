define uwsgi::config(
  $ensure
) {

  Account::System <| title == $title |>

  file { "/var/run/uwsgi/${title}":
    ensure   => directory,
    owner    => $title,
    mode     => '0751'
  }

  file {
    "/etc/uwsgi/apps-available/${title}.ini":
      ensure  => $ensure ? {
        present => file,
        default => absent
      },
      source  => [
        "puppet:///modules/uwsgi/etc/uwsgi/apps-available/${title}.ini.${::hostname}",
        "puppet:///modules/uwsgi/etc/uwsgi/apps-available/${title}.ini.${::serverkind}",
        "puppet:///modules/uwsgi/etc/uwsgi/apps-available/${title}.ini"
      ],
      require => [
        Package['uwsgi-plugin-python', 'uwsgi-plugin-python3'],
        File["/var/run/uwsgi/${title}"]
      ]
  }

  file {
    "/etc/uwsgi/apps-enabled/${title}.ini":
      ensure  => $ensure ? {
        present  => link,
        default  => absent
      },
      target  => "/etc/uwsgi/apps-available/${title}.ini",
      require => File["/etc/uwsgi/apps-available/${title}.ini"],
      notify  => Service['uwsgi']
  }

  # dirs for source code
  file { "/var/lib/uwsgi/${title}":
    ensure   => directory,
    owner    => 'deployer',
    group    => 'uwsgi',
    mode     => '0770'
  }

  file { "/var/lib/uwsgi/${title}/production":
    ensure   => directory,
    owner    => 'deployer',
    group    => 'uwsgi',
    mode     => '0770'
  }

  # dirs for media/statics
  file { "/var/www/${title}/public":
    ensure   => directory,
    owner    => $title,
    group    => 'webroot',
    mode     => '0660'
  }

  file { "/var/www/${title}/public/static":
    ensure   => directory,
    owner    => $title,
    group    => 'webroot',
    mode     => '0660'
  }

  file { "/var/www/${title}/public/media":
    ensure   => directory,
    owner    => $title,
    group    => 'webroot',
    mode     => '0660'
  }
}
