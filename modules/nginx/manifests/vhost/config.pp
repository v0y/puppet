define nginx::vhost::config {
  $owner = $title
  $group = $title

  file {
    "/etc/nginx/sites-available/${title}":
      ensure  => file,
      source  => [
        "puppet:///modules/nginx/etc/nginx/sites-available/${title}.${::hostname}",
        "puppet:///modules/nginx/etc/nginx/sites-available/${title}"
      ],
      notify  => Service['nginx'],
      require => [
        File["/var/www/${title}/public"]
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
