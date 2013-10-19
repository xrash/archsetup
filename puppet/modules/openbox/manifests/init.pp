class openbox {
  require user

  file { "/home/$username/.xinitrc":
    ensure  => 'present',
    content => template('openbox/xinitrc.erb'),
    owner   => $username,
    group   => $username,
  }
  
  file { "/home/$username/.config/openbox":
    ensure  => 'present',
    source  => 'puppet:///modules/openbox/config',
    recurse => true,
    owner   => $username,
    group   => $username,
  }
}
