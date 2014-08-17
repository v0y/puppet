define account::human(
  $uid,
  $gid,
  $home,
  $home_mode,
  $shell,
  $groups
) {
  group {
    $title:
      ensure => present,
      gid    => $gid
  }

  user {
    $title:
      ensure  => present,
      uid     => $uid,
      gid     => $gid,
      shell   => $shell,
      home    => $home,
      groups  => $groups,
      require => Group[$title]
  }

  file {
    $home:
      ensure  => directory,
      owner   => $title,
      group   => $title,
      mode    => $home_mode,
      require => User[$title]
  }
}
