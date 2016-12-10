#!/usr/bin/env python3
import os
import shutil

os.chdir("~")
os.remove(".vimrc")
shutil.rmtree(".vim/")

print("############################")
print("#   vim has been removed   #")
print("############################")
