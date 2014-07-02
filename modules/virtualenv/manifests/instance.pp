define virtualenv::instance(
  $user
) {
  exec { "virtualenv /var/lib/virtualenv/${title}":
    unless  => "test -d /var/lib/virtualenv/${title}",
    user    => $user,
  }
}
