
###############
# AWS aliases #
###############
# print table of subnets and most relevant info
alias alsubnets="aws ec2 describe-subnets  --query 'Subnets[*].{SubnetId: SubnetId, Name:Tags[?Key==\`Name\`].Value[] | [0],CidrBlock: CidrBlock, VpcId: VpcId, AvailabilityZone: AvailabilityZone}' --output table"
# print table of vpcs and most relevant info
alias alvpcs="aws ec2 describe-vpcs --query 'Vpcs[*].{VpcId:VpcId,CidrBlock:CidrBlockAssociationSet[0].CidrBlock,Name:Tags[?Key==\`Name\`].Value[] | [0],CreatedTime:CreatedTime}' --output table"
#alias alvpcs="aws ec2 describe-vpcs --query 'Vpcs[*].{VpcId:VpcId,Name:Tags[?Key==`Name`].Value[] | [0], TagValue:Tags[?Key==\`tagName\`].Value[] | [0]}' --output table "


###############
# git aliases #
###############
# Git Shortcuts
# #####################################

alias diff="git difftool"                                  # Open file in git's default diff tool <file>
alias fetch="git fetch origin"                             # Fetch from origin
alias gamend='git commit --amend'                          # Add more changes to the commit
alias gap='git add -p'                                     # Step through each change
alias gba='git branch -a'                                  # Lists local and remote branches
alias gc="git --no-pager commit"                           # Commit w/ message written in EDITOR
alias gcl='git clone --recursive'                          # Clone with all submodules
alias gcm="git --no-pager commit -m"                       # Commit w/ message from the command line <commit message>
alias gcv="git --no-pager commit --no-verify"              # Commit without verification
alias ginitsubs='git submodule update --init --recursive'  # Init and update all submodules
alias gundo="git reset --soft HEAD^"                       # Undo last commit
alias gs='git --no-pager status -s --untracked-files=all'  # Git status
alias gsearch='git rev-list --all | xargs git grep -F'     # Find a string in Git History <search string>
alias gss='git remote update && git status -uno'           # Are we behind remote?
alias gsubs='git submodule update --recursive --remote'    # Update all submodules
alias gup="git remote update -p; git merge --ff-only @{u}" # Update & Merge
alias undopush="git push -f origin HEAD^:master"           # Undo a git push
alias unstage='git reset HEAD'                             # Unstage a file

# From Git-Extras (https://github.com/tj/git-extras)
alias obliterate='git obliterate'       # Completely remove a file from the repository, including past commits and tags
alias release='git-release'             # Create release commit with the given <tag> and other options
alias rename-branch='git rename-branch' # Rename a branch and sync with remote. <old name> <new name>
alias rename-tag='git rename-tag'       # Rename a tag (locally and remotely). <old name> <new name>
alias ignore='git ignore'               # Add files to .gitignore. Run without arguments to list ignored files.
alias ginfo='git info --no-config'      # Show information about the current repository.
alias del-sub='git delete-submodule'    # Delete a submodule. <name>
alias del-tag='git delete-tag'          # Delete a tag. <name>
alias changelog='git changelog'         # Generate a Changelog from tags and commit messages. -h for help.
alias garchive='git archive'            # Creates a zip archive of the current git repository. The name of the archive will depend on the current HEAD of your git repository.
alias greset='git reset'                # Reset one file to HEAD or certain commit. <file> <commit (optional)>
alias gclear='git clear-soft'           # Does a hard reset and deletes all untracked files from the working directory, excluding those in .gitignore.
alias gbrowse='git browse'              # Opens the current git repository website in your default web browser.
alias gtimes='git utimes'               # Change files modification time to their last commit date.


#docker
alias di="docker image"
alias dc="docker container"
alias de="docker exec"
alias dcls="docker container list"
alias dils="docker image list"
alias dls="docker ps -a"



# Alias definitions.
# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias ip='ip -c'
alias ipbr='ip -c -br address'


alias bshedit="vim ~/.bash_profile"
alias webgo="python3 -m http.server 80"
alias nseq="ls -l /usr/share/nmap/scripts | grep -i "

alias htbvpn='openvpn /home/omega/vpn/htb.ovpn'
alias mkvpn='vim /home/omega/vpn/htb.ovpn'
alias pmap='proxychains -q nmap -sT -Pn'
alias nmap='nmap --stylesheet "https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl"'
alias qmap='nmap --top-ports=150 -T4'
alias fullmap='nmap -T4 -sC -sV -O'
alias pffuf='ffuf -x http://localhost:8080'
alias t1ip="ip ad l tun0 | grep inet\  | awk '{split($0,a,\" \"); split(a[2],b,\"/\");print b[1]}'"
alias rfuf='ffuf -w /wordlists/dirb/small.txt -recursion -recursion-depth 2 -e .txt,.bak,.php,.htm,.html'
alias qfuf='ffuf -w /NI'
alias xfuf='ffuf -w /wordlists/dirb/small.txt -e .txt,.bak,.php,.htm,.html'
alias bfuf='ffuf -w /ulist/common-admins.txt:UFUZZ -w /plist/quick_win_passwords.txt:PFUZZ'
#make postdata fuffy
#try fix this
#for gettings ports from nmap.xml
alias portsplz="grep -oE --color 'portid=\"[[:digit:]]+\"'"
alias quickwin="medusa -f -O medusa.log -U /ulist/top-usernames-shortlist.txt -P /plist/quick_win_passwords.txt -t 10"
alias portmap="nmap -p- -oN allports"
alias http-map="nmap --script \"http-* and safe and not brute\""
