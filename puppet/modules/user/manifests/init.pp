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

  file { 'sshdir':
    path  => "/home/$username/.ssh",
    owner => $username,
    group => $username,
    require => User[$username],
  }
  
  exec { 'ssh-keygen':
    command => "ssh-keygen -t rsa -C '$email' -N '' -f '/home/$username/.ssh/id_rsa'",
    creates => "/home/$username/.ssh",
    user    => $username,
    require => File['sshdir'],
  }
}
