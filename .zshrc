# 2014
# vim:set et fdm=marker:
# {{{ Initialisation 
autoload -U compinit promptinit
compinit
zstyle ':completion:*' menu select
promptinit

# }}}
# {{{ Aliases 
# Navigation
alias ..='cd ..'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
# TYPO BEGONE
alias cd..='cd ..'

# Programming
alias mk='make'
alias mkc='make clean'

alias cc99='gcc -O3 -std=c99 -Wall -Wno-unused-parameter -Wextra'
alias cc89='gcc -O3 -std=c89 -Wall -Wno-unused-parameter -Wextra'
alias c11="gcc --std=c11"

# Editors
alias vi='vim'
alias ivm='vim'
alias vmi='vim'
# vim is lief
alias v='vim'
alias emacsc='emacsclient -c'
alias em='emacs'

# Common configs
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

# ls aliases
alias l='ls'
alias lg='ls | grep'
alias ll='ls -l'
alias la='ls -al'

# pacman aliases
alias pc='pacman'
alias pcs='pacman -S'
alias pcss='pacman -Ss'
alias pcsyu='pacman -Syu'

# grep aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias x='startx'

# Archive
alias tart="tar -tvf"
alias tarx="tar -xvf"

alias uz="unzip"

# zsh things
alias clr="clear"

alias reload='source ~/.zshrc'

# Git
alias ga='git add'
alias gb='git branch'
alias gci='git commit'
alias gcln='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gdmom='git diff master origin/master'
alias gfu='git fetch upstream'
alias gi='git init'
alias gmum='git merge upstream/master'
alias gmv='git mv'
alias gp='git push'
alias gpull='git pull'
alias gpom='git push origin master'
alias gr='git reset'
alias grao='git remote add origin'
alias grau='git remote add upstream'
alias gst='git status'

# Systemd
alias sctl='systemctl'
# }}}
# {{{ Keybinds
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

# Get the following keys to actually work.
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# Key bindings for a more reasonable workflow and up to the times.
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# }}}
# {{{ Rice 
# - ls colours
alias ls="ls --group-directories-first --color -v"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:';

# - gcc colours
export GCC_COLORS=1

# - man colours
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# # Other aliases of poweruse
# # ls -a immediately after cd
# function chpwd() {
# 	    emulate -L zsh
# 	        ls -A
# }

# Powerline config
autoload -U colors && colors
function powerline_precmd() {
   export PS1="$(~/bin/powerline-shell.py $? --shell zsh --cwd-only)"
}

function install_powerline_precmd() {
   for s in "${precmd_functions[@]}"; do
	if [ "$s" = "powerline_precmd" ]; then
             return
        fi
    done
    precmd_functions+=(powerline_precmd)
}

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# }}}
# {{{ Configuration 
# Add PATH variables
export PATH=$PATH:/root/.gem/ruby/2.1.0/bin
export PATH=$PATH:.

# Enable word manipulation outside of vim
local WORDCHARS="${WORDCHARS:s#/#}"
bindkey "^[Oc"  forward-word
bindkey "^[Od"  backward-word
bindkey "^H"    backward-delete-word
bindkey "^[[3^" forward-delete-word

# Make sure the terminal is in application mode
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
		printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi

# Disable mapping for pausing/suspending term output
stty stop undef
stty start undef

# Only use powerline if X is running (Environment variable should be set in .xinitrc)
# Defaults to displaying walters unless the precmd has been run.
# Note: Not enough bash-foo and time to get this werking.

#if [ $X_RUNNING ]; then
        install_powerline_precmd
#else
#prompt walters
#fi

# Set vim as default editor
export EDITOR=vim
export VISUAL=vim

# Automatically cd into a dir if typed without anything.
setopt AUTO_CD

# History search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

# "Command not found" hook
# Removed: Incredibly slow.
# source /usr/share/doc/pkgfile/command-not-found.zsh

# }}}
# {{{ Custom functions 
# Stream to Twitch
function streaming() {
        INRES="1920x1080" # input resolution
        OUTRES="1920x1080" # output resolution
        FPS="15" # target FPS
        GOP="30" # i-frame interval, should be double of FPS, 
        GOPMIN="15" # min i-frame interval, should be equal to fps, 
        THREADS="2" # max 2 ;__;
        CBR="1000k" # constant bitrate (should be between 1000k - 3000k)
        QUALITY="ultrafast"  # one of the many FFMPEG preset
        AUDIO_RATE="44100"
        STREAM_KEY="$1" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
        SERVER="live-sin-backup"

        #ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :1.0 -f alsa -i default -f flv -ac 2 -ar $AUDIO_RATE \
        #        -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
        #        -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
        #        -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
        ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :1.0 -f flv -ac 2 -ar $AUDIO_RATE \
                -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
                -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
                -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
}

# }}}
