class { 'python' :
  version    => '3',
  pip        => true,
  dev        => true,
  virtualenv => true,
  gunicorn   => false,
}
