class fortune {
  require user

  vcsrepo { 'fortune-lotgh':
    path     => "/home/$username/fortune-lotgh",
    ensure   => 'present',
    provider => 'git',
    source   => 'https://github.com/xrash/fortune-lotgh.git',
    owner    => $username,
    group    => $username,
  }

  exec { "make install":
    cwd     => "/home/$username/fortune-lotgh",
    creates => "/home/$username/fortune-lotgh/lotgh.dat",
    require => Vcsrepo['fortune-lotgh'],
  }
}
