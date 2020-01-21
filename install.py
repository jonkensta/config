#!/usr/bin/env python

"""
Script for installing configuration files in a home directory.
"""

import os
import argparse


def main():
    """Install configuration files."""
    parser = argparse.ArgumentParser(description=main.__doc__)
    parser.add_argument(
        "--root",
        default=os.path.expanduser("~"),
        help="base directory to install the configuration files.",
    )
    args = parser.parse_args()

    if not os.path.isdir(args.root):
        raise ValueError(f"{args.root} is not a directory")

    root = os.path.abspath(args.root)

    configs = [
        ("vimrc", ".vimrc"),
        ("zshrc", ".zshrc"),
        ("inputrc", ".inputrc"),
        ("xinitrc", ".xinitrc"),
        ("Xmodmap", ".Xmodmap"),
        ("xprofile", ".xprofile"),
        ("gitconfig", ".gitconfig"),
        ("tmux.conf", ".tmux.conf"),
        ("xbindkeysrc", ".xbindkeysrc"),
        ("i3_config", ".config/i3/config"),
        ("init.vim", ".config/nvim/init.vim"),
        ("i3status_config", ".config/i3status/config"),
        ("redshift.conf", ".config/redshift/redshift.conf"),
    ]

    for src, dst in configs:
        dst = os.path.join(root, dst)

        dst_dir, _ = os.path.split(dst)
        os.makedirs(dst_dir, exist_ok=True)

        try:
            os.symlink(src, dst)
        except OSError:
            print(f"A link to file '{src}' already exists at '{dst}'; skipping ...")

    print("Done!")


if __name__ == "__main__":
    main()
