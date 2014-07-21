node 'applejack' {
  include ntp
  include bind
  include virtual::account::system
  include virtual::group

  Group <| title == 'uwsgi' |>
  Group <| title == 'virtualenv' |>
  Group <| title == 'webroot' |>

  Account::System <| title == 'lolwtf.pl' |>
  Account::System <| title == 'voy' |>

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
