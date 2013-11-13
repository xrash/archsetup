#!/bin/sh

USERNAME="rash"
EMAIL="felipe@xra.sh"

CURDIR=$(pwd)

if [ ! -f "$(which puppet)" ]
then
    pacman -Syy base-devel --noconfirm
    pacman -Syy wget --noconfirm

    which yaourt > /dev/null
    if test "$?" = 1; then
	cd
	wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
	tar xvf package-query.tar.gz
	cd package-query
	makepkg -s --asroot --noconfirm
	pacman -U package-query-*.tar.xz --noconfirm
	cd ..
	wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
	tar xvf yaourt.tar.gz
	cd yaourt
	makepkg -s --asroot --noconfirm
	pacman -U yaourt-*.tar.xz --noconfirm
	echo NOCONFIRM=1 >> /etc/yaourtrc
	echo EDITFILES=0 >> /etc/yaourtrc
    fi

    yaourt -Syy puppet --noconfirm
fi

cd $CURDIR

export FACTER_username=$USERNAME
export FACTER_email=$EMAIL

if test "$(puppet module --modulepath=./puppet/modules list | grep stdlib)" = ""; then
    puppet module --modulepath=./puppet/modules install maestrodev/ssh_keygen
    puppet module --modulepath=./puppet/modules install puppetlabs/vcsrepo
    puppet module --modulepath=./puppet/modules install puppetlabs/stdlib
fi

puppet apply --color=false --modulepath=./puppet/modules puppet/site.pp | tee puppet.out
