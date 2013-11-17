class system {
  require packages
  
  file_line { 'kenshin':
    ensure => 'present',
    path   => '/etc/hosts',
    line   => '198.211.117.183 kenshin',
  }
  
  file_line { 'xra.sh.dev':
    ensure => 'present',
    path   => '/etc/hosts',
    line   => '127.0.0.1 xra.sh.dev',
  }

  file { '/root/.bashrc':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/system/bashrc',
  }

  file { '/root/.bash_profile':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => '/root/.bashrc',
    require => File['/root/.bashrc'],
  }

  file { '/usr/local/bin/switch-keyboard-layout':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
    source => 'puppet:///modules/system/switch-keyboard-layout',
  }
  
  file { '/etc/fonts/conf.d/70-no-bitmaps.conf':
    ensure => 'link',
    target => '/etc/fonts/conf.avail/70-no-bitmaps.conf',
  }
  
  file { '/etc/modules-load.d/virtualbox.conf':
    ensure => 'present',
    source => 'puppet:///modules/system/virtualbox.conf',
  }

  exec { 'amixer set Master unmute': }
  exec { 'amixer set Master 100': }
}
