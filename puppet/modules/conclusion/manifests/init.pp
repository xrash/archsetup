class conclusion {
  require user
  require rat
  require go
  require newsbeuter
  require fortune
  require emacs
  require wallpaper
  require i3

  exec { 'fix-permissions':
    command => "chown $username:$username /home/$username -R",
  }
}
