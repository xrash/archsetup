class rat {
  require user

  vcsrepo { "/home/$username/rat-client":
    ensure   => 'present',
    provider => 'git',
    source => 'https://github.com/xrash/rat-client.git',
    owner    => $username,
    group    => $username,
  }

  vcsrepo { "/home/$username/rat-server":
    ensure   => 'present',
    provider => 'git',
    source => 'https://github.com/xrash/rat-server.git',
    owner    => $username,
    group    => $username,
  }
}
