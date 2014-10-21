class smuxi {
  require user
  
  file { "/home/$username/.config/smuxi":
    ensure  => 'present',
    owner   => $username,
    group   => $username,
    recurse => true,
    source  => 'puppet:///modules/smuxi/config',
  }
}
