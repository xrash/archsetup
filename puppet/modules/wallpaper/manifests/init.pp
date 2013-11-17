class wallpaper {
  require user
  
  file { "/home/$username/copy":
    ensure  => 'present',
    owner   => $username,
    group   => $username,
    recurse => true,
    source  => 'puppet:///modules/wallpaper/copy',
  }
  
  exec { 'download-zip':
    command => "wget https://copy.com/6a6ffUml4INM/wallpapers?download=1 -O /tmp/wallpapers.zip",
    onlyif  => "test $(find /home/$username/copy/wallpapers -name *.jpg | wc -l) -eq 0",
    timeout => 3600,
    require => File["/home/$username/copy"],
  }
  
  exec { "unzip":
    command => "unzip /tmp/wallpapers.zip -d /home/$username/copy",
    onlyif  => "test $(find /home/$username/copy/wallpapers -name *.jpg | wc -l) -eq 0",
    timeout => 2400,
    require => [ Exec['download-zip'] ]
  }

  exec { "permissions":
    command => "chown $username:$username /home/$username/copy -R",
    unless  => "test $(stat -c %U /home/$username/copy/wallpapers/wallpapers.zip) = $username",
    require => Exec['unzip'],
  }
}
