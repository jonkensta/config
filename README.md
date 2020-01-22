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
    git vim neovim tmux \
    i3-wm i3lock i3status \
    xbindkeys xorg-xmodmap redshift \
    cbatticon network-manager-applet \
    zsh powerline zsh-syntax-highlighting zsh-completions zsh-autosuggestions
```

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
