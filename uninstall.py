#!/usr/bin/env python3
import os
import shutil

os.chdir("~")
os.remove(".vimrc")
shutil.rmtree(".vim/bundle/")
shutil.rmtree(".vim/colors/")

print("############################")
print("#   vim has been removed   #")
print("############################")
