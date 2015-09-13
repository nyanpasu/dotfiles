# Config

set fish_greeting Pomf.

set -x EDITOR vim

# Aliases

alias c "cd"
alias u "cd .."
alias b "cd -"

alias v vim

alias vimrc "vim ~/.vimrc"
alias zshrc "vim ~/.zshrc"

alias l "ls"
alias lg "ls | grep"
alias ll "ls -l"
alias la "ls -al"

alias pc "pacman"
alias pcs "pacman -S"
alias pcu "pacman -U"
alias pcss "pacman -Ss"
alias pcsy "pacman -Sy"
alias pcsyu "pacman -Syu"
alias pcr "pacman -R"

alias grep "grep --color=auto"
alias egrep "egrep --color=auto"
alias fgrep "fgrep --color=auto"

alias x "startx"

alias sctl "systemctl"

alias tf "tail -f"

function m
        set mark $argv[1]
        set targ ~/mark/$mark
        if test -e $targ
                rm $targ
        end
        ln -s (pwd) $targ
end

function g
        set mark $argv[1]
        set targ ~/mark/$mark
        if test -e $targ
                cd ~/mark/$mark
        else
                echo "No mark $mark"
        end
end

