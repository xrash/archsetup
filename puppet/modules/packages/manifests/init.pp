class packages {
  require system

  exec { 'pacman':
    command => 'pacman -Sy --noconfirm --noprogressbar git feh xorg-server xorg-xinit sudo skype firefox filezilla rlwrap openssh python ruby clisp sbcl apache php bash-completion xfce4-terminal emacs nginx nitrogen fuse openbox go unzip xorg-fonts-type1 flashplugin alsa-tools dialog wpa_supplicant xclip xsel apache-ant markdown icedtea-web-java7 notify-osd',
    timeout => 2400,
  }

  exec { 'yaourt':
    command => 'yaourt -Sy --noconfirm copy-agent flite gruler android-sdk',
    timeout => 2400,
    require => Exec['pacman'],
  }
}
