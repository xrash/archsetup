class newsbeuter {
  require user

  file { "/home/$username/.newsbeuter":
    ensure  => 'directory',
    owner   => $username,
    group   => $username,
  }
  
  file { "/home/$username/.newsbeuter/urls":
    ensure  => 'present',
    source  => 'puppet:///modules/newsbeuter/urls',
    owner   => $username,
    group   => $username,
    require => File["/home/$username/.newsbeuter"],
  }
  
  file { "/home/$username/.newsbeuter/config":
    ensure  => 'present',
    source  => 'puppet:///modules/newsbeuter/config',
    owner   => $username,
    group   => $username,
    require => File["/home/$username/.newsbeuter"],
  }
}
