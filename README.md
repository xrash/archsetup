# My Arch Linux automatic setup

After a proper Arch Linux install with internet connection up, install packages **git** and **openssh**:

    pacman -S --noconfirm git openssh

Now, run as user **root** at **/root**:

    git clone https://github.com/xrash/archsetup.git
	cd archsetup
	./install.sh

This will manually install **yaourt** and **puppet**. Then it will apply the puppet manifests.

After that, you should manually get your graphics card driver running. Tips from the Arch Wiki:

        lspci | grep VGA
        pacman -Ss xf86-video | less
        pacman -S xf86-video-vesa

# TODO

- Remove the noconfirm option from **/etc/yaourtrc** after it's not needed anymore.
- Unmute alsa mixer (requires **alsa-utils** which will be installed by the packages manifest):

        amixer set Master unmute
	    amixer set Master 100

- Disable bitmap fonts for X (bitmap fonts are ugly):

        ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/

- Add the http group to **$username** and symlink **/var/www** to **/home/$username/www**:

        usermod $username -a -G http
        ln -s /var/www /home/$username/www

- Add the LOTGH fortune file :D

- Add the /etc/modules-load.d/virtualbox.conf
