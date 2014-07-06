node 'applejack' {
  include ntp
  include bind
  include virtualenv
  include virtual::account::system
  include virtual::group

  Group <| title == 'uwsgi' |>
  Group <| title == 'virtualenv' |>
  Group <| title == 'webroot' |>

  Account::System <| title == 'lolwtf.pl' |>
}
