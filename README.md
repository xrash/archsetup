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

- Add the group **http** to **$username** and symlink **/var/www** to **/home/$username/www**:

        usermod $username -a -G http
        ln -s /var/www /home/$username/www

- Setup my newsbeuter :3

- Setup PHP, PHP-FPM, systemd and stuff... or just forget about it

- Root .bash and aliases same as user's.
