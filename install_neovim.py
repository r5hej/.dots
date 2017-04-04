#!/usr/bin/env python2
import os
import paths
import shutil
import argparse
import subprocess
import distutils.core


def parser():
    parser = argparse.ArgumentParser(description="install neovim and plugins")
    parser.add_argument("-u", "--ubuntu", dest="ubuntu", action="store_true", default=False, help="Install dependencies for ubuntu linux")
    parser.add_argument("-a", "--arch", dest="arch", action="store_true", default=False, help="Install dependencies for arch linux")
    return parser.parse_args()


def ubuntu_dependencies():
    subprocess.call(["sudo", "add-apt-repository", "ppa:neovim-ppa/unstable -y"])
    subprocess.call(["sudo", "apt", "update"])
    subprocess.call(["sudo", "apt", "install", "neovim", "python-dev", "python-pip", "python3-dev", "python3-pip -y"])
    subprocess.call(["sudo", "pip3", "install", "update", "--upgrade pip"])
    subprocess.call(["sudo", "pip3", "install", "neovim", "flake8"])
    subprocess.call(["sudo", "pip2", "install", "neovim"])


def arch_dependencies():
    os.system("sudo pacman -S neovim python-pip")
    subprocess.call(["sudo", "pip3", "install", "update", "--upgrade pip"])
    subprocess.call(["sudo", "pip2", "install", "neovim", "flake8"])
    subprocess.call(["sudo", "pip3", "install", "neovim", "flake8"])


def main():
    args = parser()

    if args.ubuntu is True:
        ubuntu_dependencies()

    elif args.arch is True:
        arch_dependencies()

    home_path = os.path.expanduser("~")
    git_path = home_path + "/.dotfiles/"
    git_nvim_path = git_path + ".config/nvim/"
    neovim_path = home_path + "/.config/nvim/"

    os.chdir(git_path)
    subprocess.call(["git", "pull"])

    os.chdir(home_path)
    distutils.dir_util.copy_tree(git_nvim_path, home_path + "/.config/")
    # shutil.copy(git_path + ".init.vim", neovim_path)
    shutil.copy((git_path + ".config/flake8", home_path + "/.config/")

    os.chdir(neovim_path)
    os.system("curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh")
    os.system("sh ./installer.sh .")

    if os.path.exists("installer.sh"):
        os.remove("installer.sh")

    # platform.linux_distribution()
    # if args.ubuntu:
    #     os.system("echo let NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 >> ~/.config/neovim/init.vim")

    print("neovim has succesfully been installed\n")
    print("Please open init.vim in neovim and run :call dein#install() and :UpdateRemotePlugin")


if __name__ == "__main__":
    main()
