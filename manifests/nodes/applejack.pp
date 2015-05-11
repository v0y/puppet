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

  include python
  python::config{
    [ 'lolwtf.pl' ]:
      ensure => present
  }
}
