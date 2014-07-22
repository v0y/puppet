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

  file { "/var/lib/uwsgi":
    ensure   => directory,
    owner    => 'root',
    mode     => '0751'
  }

  file { "/var/lib/uwsgi/${title}":
    ensure   => directory,
    owner    => $title,
    mode     => '0751'
  }
}
