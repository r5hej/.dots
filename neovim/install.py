#!/usr/bin/env python3
import os
import paths
import shutil
import subprocess
import argparse


def parser():
    parser = argparse.ArgumentParser(description="install neovim + plugins")
    parser.add_argument("-u", "--ubuntu", dest="ubuntu", action="store_true", default="False", help="Install dependencies for ubuntu linux")
    parser.add_argument("-a", "--arch", dest="arch", action="store_true", default="False", help="Install dependencies for arch linux")
    return parser.parse_args()


def ubuntu_dependencies():
    subprocess.call(["sudo", "add-apt-repository", "ppa:neovim-ppa/unstable"])
    subprocess.call(["sudo", "apt", "update"])
    subprocess.call(["sudo", "apt", "install", "neovim", "python-dev", "python-pip", "python3-dev", "python3-pip"])
    subprocess.call(["sudo", "pip3", "install", "update"])
    subprocess.call(["sudo", "pip3", "install", "neovim", "flake8"])


def arch_dependencies():
    subprocess.call(["sudo", "pacman -S", "neovim"])


def main():
    args = parser()

    if (args.ubuntu is True):
        ubuntu_dependencies()

    elif (args.arch is True):
        arch_dependencies()

    home_path = os.path.expanduser("~")
    git_path = home_path + "/.dotfiles/neovim"
    neovim_path = home_path + "/.config/nvim"
    os.chdir(git_path)
    subprocess.call(["git", "pull"])

    os.chdir(home_path)
    for path in paths.neovim_dirs:
        if (not os.path.exists(path)):
            os.mkdir(path)

    for path in paths.configs:
        shutil.copy(git_path + "/" + ".config/flake8", path)

    os.chdir(git_path)
    for path in paths.neovim_files:
        shutil.copyfile(path, neovim_path + "/" + path)

    os.chdir(neovim_path)
    os.system("curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh")
    os.system("sh ./installer.sh .")

    if (os.path.exists("installer.sh")):
        os.remove("installer.sh")

    if args.ubuntu:
        os.system("echo let NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 >> ~/.config/neovim/init.vim")

    print("###############################")
    print("#  neovim has been installed  #")
    print("###############################")
    print("\nPlease open init.vim in neovim and run :call dein#install() and :UpdateRemotePlugin")


if __name__ == "__main__":
    main()
