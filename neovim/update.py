#!/usr/bin/env python3
import os
import paths
import shutil
import subprocess
import argparse


def parser():
    parser = argparse.ArgumentParser(description="Update neovim configs")
    parser.add_argument("-c", "--commit", dest="commit", action="store_true", default="False", help="Whether to commit new changes")
    parser.add_argument("-m", "--message", dest="message", action="store", help="The message to be commited")
    return parser.parse_args()


home_path = os.path.expanduser("~")
git_path = home_path + "/.dotfiles/neovim"
neovim_path = home_path + "/.config/nvim"
args = parser()

os.chdir(git_path)
subprocess.call(["git", "pull"])

os.chdir(neovim_path)
for path in paths.neovim_files:
    shutil.copy(path, git_path + "/" + path)

os.chdir(home_path)
for path in paths.configs:
    shutil.copy(path, git_path + "/" + path)

if (args.commit is True):
    os.chdir(git_path)
    subprocess.call(["git", "add", "--all"])
    subprocess.call(["git", "commit", "-am", "\"" + args.message + "\""])
    subprocess.call(["git", "push"])
    print("commiting")

print("######################################")
print("# neovim repository has been updated #")
print("######################################")
