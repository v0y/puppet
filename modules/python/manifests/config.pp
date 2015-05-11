define python::config(
  $ensure
) {

  Account::System <| title == $title |>

  python::pyvenv { "/var/lib/virtualenv/${title}/production" :
    ensure       => present,
    version      => '3',
    owner        => $title,
    group        => 'virtualenv',
  }
}
