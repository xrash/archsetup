class alsa {
  require packages

  exec { 'amixer set Master unmute': }
  exec { 'amixer set Master 100': }
}
