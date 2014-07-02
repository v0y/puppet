define virtualenv::exec(
  $virtualenv,
  $user,
  $command = $title
) {
  exec {
    $title:
      command      => $command,
      environment  => "VIRTUAL_ENV=/var/lib/virtualenv/${virtualenv}\n",
      path         => [
        "/var/lib/virtualenv/${virtualenv}/bin",
        "/usr/local/bin",
        "/usr/bin",
        "/bin"
      ],
      timeout      => 0,
      user         => $user,
  }
}
