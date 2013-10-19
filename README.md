# My Arch Linux automatic setup

After a proper Arch Linux install with internet connection up, install packages _git_ and _openssh_:

    pacman -S --noconfirm git openssh

Now, run as user _root_ at _/root_:

    git clone https://github.com/xrash/archsetup.git
	cd archsetup
	./install.sh

This will manually install _yaourt_ and _puppet_. Then it will apply the puppet manifests.

After that, you should manually get your graphics card driver running. Tips from the Arch Wiki:

    lspci | grep VGA
	pacman -Ss xf86-video | less
	pacman -S xf86-video-vesa

# TODO

- Remove the noconfirm option from /etc/yaourtrc after it's not needed anymore.
- Unmute alsa mixer (requires alsa-utils which will be installed by the packages manifest):

    amixer set Master unmute
	amixer set Master 100

- Disable bitmap fonts for X (bitmap fonts are ugly):

    ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

