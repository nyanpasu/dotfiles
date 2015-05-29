alias c "cd"
alias u "cd .."
alias b "cd -"
alias u2 "cd ../../"
alias u3 "cd ../../../"
alias u4 "cd ../../../../"

alias mnt "mount"
alias umnt "umount"

alias mk "make"
alias mkc "make clean"

alias cc99 "gcc -O3 -std=c99 -Wall -Wno-unused-parameter -Wextra"
alias cc89 "gcc -O3 -std=c89 -Wall -Wno-unused-parameter -Wextra"
alias c11 "gcc --std=c11"

alias comp "./configure --p=/usr; and make; and make install"

alias v "emacsclient -a "" -t"
alias em "emacsclient -a "" -t"

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

alias uz "unzip"

alias clr "clear"
alias reload "source ~/.zshrc"

alias gopkg "cd ./packaging/standalone/target"
alias gocfg "cd ./webapps/ROOT/WEB-INF/classes/"

alias train "sh ~/bin/onapp/setupmontrain"
alias office "sh ~/bin/onapp/setupmonoffice"

alias ga "git add"
alias gb "git branch"
alias gci "git commit"
alias gcln "git clone"
alias gco "git checkout"
alias gcob "git checkout -b"
alias gd "git diff"
alias gdmom "git diff master origin/master"
alias gfu "git fetch upstream"
alias gi "git init"
alias gmum "git merge upstream/master"
alias gmv "git mv"
alias gp "git push"
alias gpull "git pull"
alias gpom "git push origin master"
alias gr "git reset"
alias grao "git remote add origin"
alias grau "git remote add upstream"
alias gst "git status"

alias sctl "systemctl"

alias tf "tail -f"
alias clip "VBoxClient --clipboard"
alias compfast "mvn install -Dmaven.test.skip=true -Dmaven.findbugs.skip=true"
alias mountwin "mount -tvboxsf user /mnt"
alias killgm "jps | grep Bootstrap >/dev/null; and kill -9 (jps | grep Bootstrap | cut -f 1 -d' ')"

function startgm
    gocfg
    rm aflexi.properties
    cp ~/onapp/target/aflexi.properties .
    b
    cd bin
    cp ~/onapp/target/setenv.sh .
    chmod +x setenv.sh
    sh setenv.sh
    sh startup.sh
    b
end

