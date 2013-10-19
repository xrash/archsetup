class config {
  
  file { "/home/$username/.bashrc":
    ensure  => 'present',
    source  => 'puppet:///modules/user/bashrc',
    owner   => $username,
    group   => $username,
    require => User[$username],
  }

  file { "/home/$username/.gitconfig":
    ensure  => 'present',
    content => template('user/gitconfig.erb'),
    owner   => $username,
    group   => $username,
    require => User[$username],
  }

  file { "/root/.gitconfig":
    ensure  => 'present',
    content => template('user/gitconfig.erb'),
    owner   => 'root',
    group   => 'root',
    require => User[$username],
  }
  
  file { "/home/$username/.config":
    ensure  => 'directory',
    owner   => $username,
    group   => $username,
    require => User[$username],
  }

  file { "/home/$username/.config/Terminal":
    ensure  => 'present',
    owner   => $username,
    group   => $username,
    recurse => true,
    source  => 'puppet:///modules/user/Terminal',
    require => File["/home/$username/.config"],
  }
}
