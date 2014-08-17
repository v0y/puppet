class virtual::group {
  @group {
    'uwsgi':
      ensure => present,
      gid    => 9999;

    'virtualenv':
      ensure => present,
      gid    => 9998;

    'webroot':
      ensure  => present,
      gid     => 9997;

    'ssh':
      ensure => present,
      gid    => 9996;

    'users':
      ensure  => present,
      gid     => 9995;
  }
}
