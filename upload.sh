#!/bin/bash

# set your git username and email once with git config --global user.name "yourusername", and fork https://github.com/Meghthedev/Releases to your github
# Run this script in the root of android directory
git config --global user.name "Meghthedev"
git config --global user.email "meghthedev@gmail.com"

git clone "https://github.com/$(git config --get user.name)/Releases"

# Copy all zip files to Releases Folder
find out/target/product/*/ -maxdepth 1 -type f -name "*.zip" -exec cp {} Releases/ \;

# go to cd folder
cd Releases

bash headless.sh
echo Uploaded!

cd ..
rm -rf Releases