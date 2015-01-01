node 'applejack' {
  include ntp
  include bind

  include virtual::group
  Group <| title == 'uwsgi' |>
  Group <| title == 'virtualenv' |>
  Group <| title == 'webroot' |>

  include virtual::account::system
  Account::System <| title == 'deployer' |>
  Account::System <| title == 'lolwtf.pl' |>
  Account::System <| title == 'www-data' |>

  include virtual::account::human
  Account::Human <| title == 'voy' |>

  include nginx
  nginx::vhost::config {
    [ 'lolwtf.pl' ]:
      require => [
        Uwsgi::Config['lolwtf.pl']
      ]
  }

  include uwsgi
  uwsgi::config {
    [ 'lolwtf.pl' ]:
      ensure => present
  }

  include virtualenv
  virtualenv::config{
    [ 'lolwtf.pl' ]:
      ensure => present
  }
}
