class nginx {

  package {
    'nginx-full':
      ensure => installed
  }

#  dpkg::statoverride {
#    '/etc/nginx':
#      ensure  => present,
#      owner   => 'root',
#      group   => 'root',
#      mode    => '0750',
#      require => Package['nginx-full']
#  }

  file {
    '/etc/nginx/sites-enabled/default':
      ensure  => absent,
      require => Package['nginx-full']
  }

  file {
    '/etc/nginx/nginx.conf':
      ensure  => present,
      source  => [
        "puppet:///modules/nginx/etc/nginx/nginx.conf.${::hostname}",
        "puppet:///modules/nginx/etc/nginx/nginx.conf.${::serverkind}",
        'puppet:///modules/nginx/etc/nginx/nginx.conf'
      ],
      require => Package['nginx-full'],
      notify  => Service['nginx']
  }

  service {
    'nginx':
      ensure  => running,
      require => File['/etc/nginx/nginx.conf']
  }
}
