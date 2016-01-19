import os
import argparse

parser = argparse.ArgumentParser(description='Install configuration files.')
parser.add_argument('--install_dir', type=str, default=os.path.expanduser('~'),
                    help='base directory to install the configuration files.')
args = parser.parse_args()

if not os.path.isdir(args.install_dir):
    msg = "{0} is not a directory".format(args.install_dir)
    raise ValueError(msg)

args.install_dir = os.path.abspath(args.install_dir)

dotconfigs = ['xmonad', 'vimrc', 'xmobarrc', 'inputrc', 'xinitrc', 'gitconfig', 'tmux.conf']
for config in dotconfigs:
    source = os.path.abspath(config)
    link_name = os.path.join(args.install_dir, '.' + config)
    try:
        os.symlink(source, link_name)
    except FileExistsError:
        print("Config file {0} already exists; skipping ...".format(config))

print("Done!")
