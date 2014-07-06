File {
  owner => 'root',
  group => 'root',
  mode  => '0644'
}

Exec {
  path => [
    '/usr/local/sbin',
    '/usr/local/bin',
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin'
  ],
  logoutput => false
}

file {
  '/var/www':
    ensure => directory,
    mode   => '0751'
}

stage {
  'core':
    before => Stage['main']
}
