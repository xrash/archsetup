class user {
  require packages
  include config

  user { $username:
    ensure     => present,
    shell      => '/bin/bash',
    managehome => true,
  }

  file_line { 'user_sudo':
    path => '/etc/sudoers',
    line => "$username ALL=(ALL) ALL",
  }

  exec { 'ssh-keygen':
    command => "ssh-keygen -t rsa -C '$email' -N '' -f '/home/$username/.ssh/id_rsa'",
    creates => "/home/$username/.ssh",
    require => User[$username],
  }
}
