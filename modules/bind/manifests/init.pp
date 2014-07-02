class bind {
  package {
    [ 'bind9' ]:
      ensure => installed
  }

  service {
    'bind':
      name => "bind9",
      ensure => running,
      restart => "invoke-rc.d bind9 reload",
      require => [
        Package["bind9"],
        File["/etc/bind"]
      ]
  }

  file {
    "/etc/bind":
      ensure => directory,
      recurse => true,
      group => "bind",
      source  => [
        "puppet:///modules/bind/etc/bind.${::hostname}",
        "puppet:///modules/bind/etc/bind.${::serverkind}",
        "puppet:///modules/bind/etc/bind/"
      ],
      notify => Service['bind']
  }
}
