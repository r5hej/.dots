#!/usr/bin/env python3
import os
import paths
import shutil
import subprocess
import argparse


def parser():
    parser = argparse.ArgumentParser(description="install neovim + plugins")
    parser.add_argument("-d", "--dependicies", dest="dependicies", action="store_true", default="False", help="whetever to install ubuntu dependicies for neovin")
    return parser.parse_args()


def dependicies():
    subprocess.call(["sudo", "add-apt-repository", "ppa:neovim-ppa/unstable"])
    subprocess.call(["sudo", "apt", "update"])
    subprocess.call(["sudo", "apt", "install", "neovim", "python-dev", "python-pip", "python3-dev", "python3-pip"])
    subprocess.call(["sudo", "pip3", "install", "update"])
    subprocess.call(["sudo", "pip3", "install", "neovim", "flake8"])


#  parser = argparse.ArgumentParser(description="install neovim + plugins")
#  parser.add_argument("-d", "--dependicies", dest="dependicies", action="store_true", default="False", help="whetever to install ubuntu dependicies for neovin")
#  args = parser.parse_args()
args = parser.parse_args()

if (args.dependicies is True):
    print("install dependicies")

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
    shutil.copy(git_path + ".config/flake8", path)

os.chdir(git_path)
for path in paths.neovim_files:
    shutil.copyfile(path, neovim_path + "/" + path)

os.chdir(neovim_path)
subprocess.call(["curl", "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh", ">", "installer.sh"])
subprocess.call(["sh", "./installer.sh", "."])


#  os.chdir(home_path + "/.vim/bundle/")
#  subprocess.call(["git", "clone", "https://github.com/VundleVim/Vundle.vim.git"])

#  os.chdir(home_path)
#  subprocess.call(["vim", "+PluginInstall", "+qall"])
#  os.chdir(home_path + "/.vim/bundle/YouCompleteMe")
#  subprocess.call(["./install.py"])

print("###############################")
print("#  neovim has been installed  #")
print("###############################")
print("\nPlease open init.vim in neovim and run dein#install() and :UpdateRemotePlugin")
