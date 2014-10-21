class wallpaper {
  require user
  
  file { "/home/$username/wallpapers":
    ensure  => 'present',
    owner   => $username,
    group   => $username,
    recurse => true,
    source  => 'puppet:///modules/wallpaper/wallpapers',
  }

  exec { 'get':
    command => '/home/$username/wallpapers/get.sh',
    require => File["/home/$username/wallpapers"],
  }
}
