class conclusion {
  require user
  require rat
  require go
  require newsbeuter
  require fortune
  require openbox
  require wallpaper
  require emacs

  exec { 'fix-permissions':
    command => "chown $username:$username /home/$username -R",
  }
}
