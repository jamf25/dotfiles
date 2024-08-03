# install ctags
install ctags

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up fzf key bindings
fzf --fish | source

clone https://github.com/junegunn/fzf.git

run install


install vimplug 


### Install vim-plug
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

