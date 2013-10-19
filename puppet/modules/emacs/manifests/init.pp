class emacs {
  require user

  vcsrepo { "emacs":
    path     => "/home/$username/emacs",
    ensure   => 'present',
    provider => 'git',
    source   => 'https://github.com/xrash/emacs.git',
    owner    => $username,
    group    => $username,
  }

  file { "/home/$username/.emacs.d":
    ensure   => 'link',
    target   => "/home/$username/emacs",
    owner    => $username,
    group    => $username,
    require  => Vcsrepo["emacs"],
  }

  file { '/root/.emacs.d':
    ensure   => 'link',
    target   => "/home/$username/emacs",
    owner    => 'root',
    group    => 'root',
    force    => true,
    require  => Vcsrepo['emacs'],
  }
}
