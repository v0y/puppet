define nginx::vhost::config {
  $owner = $title
  $group = $title

  file {
    [ "/var/www/${title}/public_html" ]:
      ensure  => directory,
      mode    => '0751',
      owner   => $owner,
      group   => $group
  }

  file {
    "/etc/nginx/sites-available/${title}":
      ensure  => file,
      source  => [
        "puppet:///modules/nginx/etc/nginx/sites-available/${title}.${::hostname}",
        "puppet:///modules/nginx/etc/nginx/sites-available/${title}"
      ],
      notify  => Service['nginx'],
      require => [
        File["/var/www/${title}/public_html"]
      ]
  }

  file {
    "/etc/nginx/sites-enabled/${title}":
      ensure  => link,
      target  => "/etc/nginx/sites-available/${title}",
      require => File["/etc/nginx/sites-available/${title}"],
      notify  => Service['nginx']
  }
}
