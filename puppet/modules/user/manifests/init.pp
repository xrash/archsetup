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
  
  ssh_keygen { $username:
    require => User[$username],
  }
}
