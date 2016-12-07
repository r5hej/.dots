#!/usr/bin/env python3
import os
import paths
import shutil
import subprocess
import sys


def install_vim(home_path, git_path):
    """
    Install vim with plugins

    For ubuntu, the following packages are needed:
        exuberant-ctags
        build-essentials
        python-dev
        python3-dev
        cmake
    """

    os.chdir(home_path)
    for path in paths.vim_dirs:
        os.makedirs(path, exist_ok=True)

    os.chdir(git_path)
    for path in paths.vim_files:
        shutil.copyfile(path, home_path + "/" + path)

    for tree in paths.vim_trees:
        if os.path.exists(home_path + "/" + tree):
            shutil.rmtree(home_path + "/" + tree)

        print(os.getcwd())
        shutil.copytree(tree, home_path + "/" + tree)

    os.chdir(home_path)
    subprocess.call(["vim", "+PluginInstall", "+qall"])
    os.chdir(home_path + "/.vim/bundle/YouCompleteMe")
    subprocess.call(["./install.py"])

    print("############################")
    print("#  vim has been installed  #")
    print("############################")


def main():
    #if not sys.argv[1]:
    #    sys.exit(-1)

    home = os.path.expanduser("~")
    git_dir = home + "/.vim-magic"
    os.chdir(git_dir)
    subprocess.call(["git", "pull"])

#    if sys.argv[1] == "vim":
#        install_vim(home, git_dir)
    install_vim(home, git_dir)

if __name__ == "__main__":
    main()
