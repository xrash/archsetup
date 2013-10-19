# Automatic setup of my development environment in Arch Linux

After a proper Arch Linux install with internet connection up and running, run as user _root_ at _/root_:

    git clone https://github.com/xrash/archsetup.git
	cd archsetup
	./install.sh

You probably have to install git and openssh before:

    pacman -S --noconfirm git openssh

This will manually install _yaourt_ and _puppet_. Then it will apply the puppet manifests.

At this point, you should get your graphics card driver running manually. From the Arch Wiki:

    lspci | grep VGA
	pacman -Ss xf86-video | less
	pacman -S xf86-video-vesa


#TODO

- Remove the noconfirm option from /etc/yaourtrc after it's not needed anymore
- Execute alsa set Master 100 after install alsa-utils
- Disable bitmap fonts for X:

    ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

