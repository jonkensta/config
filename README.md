My user configuration
=====================

This repository contains the config that I use for setting up a user on Arch.

Install dotfiles
----------------
Within this repo:

```bash
python install.py
```

Arch Packages
-------------

```bash
sudo pacman -S \
    i3-wm i3lock i3status \
    git vi vim neovim tmux \
    wget moreutils base-devel \
    powerline ttf-font-awesome \
    xbindkeys xorg-xmodmap redshift \
    xfce4-screenshooter xfce4-terminal \
    cbatticon network-manager-applet udiskie \
    zsh zsh-syntax-highlighting zsh-completions zsh-autosuggestions
```

Install oh-my-zsh
-----------------

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh
```

You may need to fix the symlink to .zshrc if it is overwritten.

Vundle
------

```bash
mkdir -p ~/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
nvim +PluginInstall +qall
```

Tmux TPM
--------

```bash
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then `prefix` + <kdb>I</kdb> within tmux to install plugins.

User groups
-----------

```bash
usermod -a -G sys,docker,audio,wheel,uucp,lpadmin,gpiouser jstarr
```

Creating any group that does not exist already.
