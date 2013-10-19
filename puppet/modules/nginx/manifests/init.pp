class nginx {
  require user
  
  file { '/var/www':
    ensure => 'directory',
    owner  => 'http',
    group  => 'http',
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => 'present',
    source  => 'puppet:///modules/nginx/nginx.conf',
  }

  file { '/etc/nginx/conf.d':
    ensure  => 'present',
    source  => 'puppet:///modules/nginx/conf.d',
    recurse => true,
  }

  file { '/etc/nginx/conf.d/xra.sh.dev.conf':
    ensure  => 'present',
    content => template('nginx/xra.sh.dev.conf.erb'),
    require => File['/etc/nginx/conf.d'],
  }
}
