# My user configuration

This repository contains the config that I use for setting up a user on Arch.

## Install dotfiles

The dotfiles are organized as stow packages and can be installed as:

```
stow --no-folding --dotfiles -v -t ~ dotfiles
stow --no-folding --dotfiles -v -t ~/.config config
```

## Create Swapfile

The following commands create an 8GB swap file in the root directory:

```bash
dd if=/dev/zero of=/swapfile bs=1M count=8k status=progress
chmod 0600 /swapfile
mkswap -U clear /swapfile
swapon /swapfile
```

at which point you can add using `genfstab`

## `systemd-boot`

Assuming you have created an EFI partition and this is correctly typed as `EFI Partition`, you can run

```bash
bootctl install
```

Afterwards, add entries to `/boot/loader/entries` along the lines of:

```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=LABEL=ARCH mem_sleep_default=deep rw
```

and for a backup:

```
title   Arch Linux (fallback initramfs)
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux-fallback.img
options root=LABEL=ARCH mem_sleep_default=deep rw
```

For the above, you can use `e2label` to add a label to an `ext4`-formatted drive.

Then, register the default to `/boot/loader/loader.conf`:

```
default arch.conf
timeout 4
console-mode max
editor  no
```

And finally, `bootctl update` for paranoia-sake.

## Arch Packages

When bootstrapping system:

```bash
base linux linux-firwmare \
dhcpcd iwd \
git vim neovim tmux
```

Other useful packages:

```bash
i3-wm i3lock i3status \
git vi vim neovim tmux \
wget moreutils inetutils base-devel \
powerline ttf-font-awesome \
sudo xdg-user-dirs-update \
xbindkeys xorg-xmodmap \
xfce4-screenshooter xfce4-terminal \
redshift inetutils cbatticon network-manager-applet udiskie \
zsh zsh-syntax-highlighting zsh-completions zsh-autosuggestions \
cpupower intel-ucode thermald \
mlocate fzf
```

## Install oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
```

You may need to fix the symlink to .zshrc if it is overwritten.

## Vundle

```bash
mkdir -p ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
```

## Packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Tmux TPM

```bash
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then `prefix` + <kdb>I</kdb> within tmux to install plugins.

## User groups

After installing `xdg-user-dirs-update`:

```bash
sudo systemctl enable --now xdg-user-dirs-update.service
```

After creating `jstarr` user:

```bash
usermod -a -G sys,docker,audio,wheel,uucp,lpadmin,gpiouser jstarr
```

Creating any group that does not exist already.

## Trim

Enable periodic trim for SSD:

```bash
sudo systemctl enable --now fstrim.service fstrim.timer
```

## Reflector

```
/etc/xdg/reflector/reflector.conf
```

```
# Set the output path where the mirrorlist will be saved (--save).
--save /etc/pacman.d/mirrorlist

# Select the transfer protocol (--protocol).
--protocol https

# Select the country (--country).
# Consult the list of available countries with "reflector --list-countries" and
# select the countries nearest to you or the ones that you trust. For example:
--country 'United States'

# Use only the  most recently synchronized mirrors (--latest).
--latest 5

# Sort the mirrors by synchronization time (--sort).
--sort age
```

```bash
sudo systemctl enable --now reflector
```

## `thermald`

```bash
sudo systemctl enable --now thermald
```

## `ipython`

Use the following in the `ipython` configuration file:

```python
## Shortcut style to use at the prompt. 'vi' or 'emacs'.
c.TerminalInteractiveShell.editing_mode = 'vi'

## Set the editor used by IPython (default to $EDITOR/vi/notepad).
c.TerminalInteractiveShell.editor = 'vi'
```

## `DHCPCD`

Open `/etc/dhcpcd.conf` and uncomment the following:

```
# Inform the DHCP server of our hostname for DDNS.
hostname
```
