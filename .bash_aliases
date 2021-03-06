# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias bc='bc -l ~/.bin/math.bc'
alias l='ls -F -v'
alias mv='mv -nv'

alias mkdir='mkdir -p'
alias cp='cp -vn'
alias ls='ls -F'
alias gl="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias gacp="git ls-files --others --exclude-standard >>.gitignore;git add -A;git commit -m 'generic commit';git push"
alias repoinit="cscope -R -q -k -b;ctags -R .;echo cscope.{in.,po.,}out tags .gitignore | sed 's/ /\n/g' >>.gitignore"
