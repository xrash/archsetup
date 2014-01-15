class i3 {
  require user

  file { "/home/$username/.xinitrc":
    ensure  => 'present',
    source  => 'puppet:///modules/i3/xinitrc',
    owner   => $username,
    group   => $username,
  }

  file { "/home/$username/.i3/config":
    ensure  => 'present',
    source  => 'puppet:///modules/i3/config',
    owner   => $username,
    group   => $username,
  }
}
