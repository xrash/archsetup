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

  exec { 'get-gonf':
    command     => 'go get github.com/xrash/gonf',
    creates     => "/home/$username/go/src/github.com/xrash/gonf",
    environment => "GOPATH=/home/$username/go",
    require     => File['gopath'],
  }

  exec { 'get-domi':
    command     => 'go get github.com/xrash/domi',
    creates     => "/home/$username/go/src/github.com/xrash/domi",
    environment => "GOPATH=/home/$username/go",
    require     => File['gopath'],
  }
}
