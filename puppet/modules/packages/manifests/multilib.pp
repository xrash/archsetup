class multilib {
  file { 'pacman-conf-multilib':
    path => '/etc/pacman.conf',
    source  => 'puppet:///modules/packages/pacman.conf',
  }

  exec { 'multilib':
    command => 'pacman -Syyu --noconfirm',
    require => File['pacman-conf-multilib'],
    creates => '/usr/lib32',
  }
}
