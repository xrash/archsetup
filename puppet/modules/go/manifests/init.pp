class go {
  require user
  
  file { 'gopath':
    path    => "/home/$username/go",
    ensure  => 'present',
    owner   => $username,
    group   => $username,
    recurse => true,
    source  => 'puppet:///modules/go/gopath',
  }
}
