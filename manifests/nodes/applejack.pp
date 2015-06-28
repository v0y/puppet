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
  Account::System <| title == 'hotele.lolwtf.pl' |>

  include virtual::account::human
  Account::Human <| title == 'voy' |>

  include nginx
  nginx::vhost::config {
    [ 'lolwtf.pl' ]:
      require => [
        Uwsgi::Config['lolwtf.pl']
      ]
  }

  nginx::vhost::config {
    [ 'hotele.lolwtf.pl' ]:
      require => [
        Uwsgi::Config['hotele.lolwtf.pl']
      ]
  }

  include uwsgi
  uwsgi::config {
    [ 'lolwtf.pl', 'hotele.lolwtf.pl' ]:
      ensure => present
  }

#  include python
#  class { 'python' :
#    version    => '3',
#    pip        => true,
#    dev        => true,
#    virtualenv => true,
#    gunicorn   => false,
#  }

#  python::pyvenv { '/var/www/lolwtf.pl' :
#    ensure       => present,
#    version      => '3',
#    systempkgs   => true,
#    venv_dir     => '/var/lib/virtualenv/lolwtf.pl',
#    owner        => 'lolwtf.pl',
#    group        => 'virtualenv',
#  }

  include virtualenv
  virtualenv::config{
    [ 'lolwtf.pl', 'hotele.lolwtf.pl' ]:
      ensure => present
  }
}
