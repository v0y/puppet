define virtualenv::config(
  $ensure
) {

  Account::System <| title == $title |>

  file { "/var/lib/virtualenv/${title}":
    ensure   => directory,
    owner    => $title,
    mode     => '0664',
    group    => 'virtualenv'
  }

  python::pyvenv { "/var/lib/virtualenv/${title}/production" :
    ensure       => present,
    version      => 'system',
    owner        => $title,
    group        => 'virtualenv',
  }
}
