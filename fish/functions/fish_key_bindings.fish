function fish_user_key_bindings
  fzf --fish | source
end
# tmux bindings
function txls
    tmux ls
end

function txk
    tmux kill-session -t 
end
function txkq
    tmux kill-server
end
# Open file in git's default diff tool <file>
function diff
    git difftool $argv
end

# Fetch from origin
function fetch
    git fetch origin
end

# Add more changes to the commit
function gamend
    git commit --amend
end

# Step through each change
function gap
    git add -p
end

# Lists local and remote branches
function gba
    git branch -a
end

# Commit w/ message written in EDITOR
function gc
    git --no-pager commit
end

# Clone with all submodules
function gcl
    git clone --recursive $argv
end

# Commit w/ message from the command line <commit message>
function gcm
    git --no-pager commit -m $argv
end

# Commit without verification
function gcv
    git --no-pager commit --no-verify
end

# Init and update all submodules
function ginitsubs
    git submodule update --init --recursive
end

# Undo last commit
function gundo
    git reset --soft HEAD^
end

# Git status
function gs
    git --no-pager status -s --untracked-files=all
end

# Find a string in Git History <search string>
function gsearch
    git rev-list --all | xargs git grep -F $argv
end

# Are we behind remote?
function gss
    git remote update && git status -uno
end

# Update all submodules
function gsubs
    git submodule update --recursive --remote
end

# Update & Merge
function gup
    git remote update -p; and git merge --ff-only @{u}
end

# Undo a git push
function undopush
    git push -f origin HEAD^:master
end

# Unstage a file
function unstage
    git reset HEAD
end

# Completely remove a file from the repository, including past commits and tags
function obliterate
    git obliterate
end

# Create release commit with the given <tag> and other options
function release
    git-release $argv
end

# Rename a branch and sync with remote. <old name> <new name>
function rename-branch
    git rename-branch $argv
end

# Rename a tag (locally and remotely). <old name> <new name>
function rename-tag
    git rename-tag $argv
end

# Add files to .gitignore. Run without arguments to list ignored files.
function ignore
    git ignore $argv
end

# Show information about the current repository.
function ginfo
    git info --no-config
end

# Delete a submodule. <name>
function del-sub
    git delete-submodule $argv
end

# Delete a tag. <name>
function del-tag
    git delete-tag $argv
end

# Generate a Changelog from tags and commit messages. -h for help.
function changelog
    git changelog $argv
end

# Creates a zip archive of the current git repository. The name of the archive will depend on the current HEAD of your git repository.
function garchive
    git archive $argv
end

# Reset one file to HEAD or certain commit. <file> <commit (optional)>
function greset
    git reset $argv
end

# Does a hard reset and deletes all untracked files from the working directory, excluding those in .gitignore.
function gclear
    git clear-soft
end

# Opens the current git repository website in your default web browser.
function gbrowse
    git browse
end

# Change files modification time to their last commit date.
function gtimes
    git utimes
end

