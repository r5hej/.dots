#!/usr/bin/env python2
import os
import paths
import shutil
import argparse
import subprocess
import distutils.core


def parser():
    parser = argparse.ArgumentParser(description="Update dotfiles repository")
    parser.add_argument("-m", "--message", dest="message", action="store", help="The commit message")
    return parser.parse_args()


def main():
    args = parser()

    home_path = os.path.expanduser("~")
    git_path = home_path + "/.dotfiles/"
    config_path = git_path + "/.config/"
    home_config_path = home_path + "/.config/"

    for path in paths.config_dirs:
        distutils.dir_util.copy_tree(home_config_path + path, config_path + path)

    for path in paths.conf_files:
        shutil.copy("{}/{}".format(home_path, path), git_path + path)

    if (args.message):
        os.chdir(git_path)
        subprocess.call(["git", "add", "--all"])
        subprocess.call(["git", "commit", "-am", args.message])
        subprocess.call(["git", "push"])


if __name__ == "__main__":
    main()
