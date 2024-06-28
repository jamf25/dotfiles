#!/bin/bash

if [ ! -d "$HOME/.config" ]; then
  mkdir "$HOME/.config"
fi


#find only directories in the current directory
for i in $(ls -d */); do
  dir_name=${i%/}
  # test if symlinks already exist for these directories
  if [ ! -L "$HOME/.config/$dir_name" ]; then
    # if not overwrite whatever is there with the new symlink
    ln -f -s "$PWD/$dir_name"  "$HOME/.config/$dir_name"
  fi
done

# overwrite any existing bash files since i just don't know how to make it use .config/bash
ln -f -s $HOME/.bashrc $PWD/.bashrc
ln -f -s $HOME/.bash_profile $PWD/.bash_profile
ln -f -s $HOME/.vimrc $PWD/.vimrc

echo "done"

