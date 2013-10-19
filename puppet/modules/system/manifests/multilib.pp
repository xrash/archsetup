class multilib {
  file { 'pacman-conf-multilib':
    path => '/etc/pacman.conf',
    source  => 'puppet:///modules/system/pacman.conf',
  }
  exec { 'pacman -Syyu --noconfirm':
    require => File['pacman-conf-multilib'],
    creates => '/usr/lib32',
  }
}
