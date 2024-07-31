text

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up fzf key bindings
fzf --fish | source

clone https://github.com/junegunn/fzf.git

run install
