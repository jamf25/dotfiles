#!/bin/bash

for i in `ls -d */`; do
  ln -s $HOME/.config/$i $PWD/$i
done

ln -s $HOME/.bashrc $PWD/.bashrc
ln -s $HOME/.bash_profile $PWD/.bash_profile

