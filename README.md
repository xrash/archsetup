# My Arch Linux automatic setup

After a proper Arch Linux install with internet connection up, install package **git**:

    pacman -S --noconfirm git

Now, run as user **root**:

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

- Add the group **http** to **$username** and symlink **/var/www** to **/home/$username/www**:

        usermod $username -a -G http
        ln -s /var/www /home/$username/www

- Add the LOTGH fortune file :D
