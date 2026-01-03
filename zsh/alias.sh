
alias _cat='/bin/cat'
alias cat='bat '

alias _ls='/bin/ls'
alias ls='exa --group-directories-first --color=auto'
alias list='exa --sort=extension --group-directories-first -l'

alias _tree='/usr/bin/tree'
alias tree='tree -A --dirsfirst'

alias _less='/usr/bin/lee'
alias less='less -i'

alias fzf_bat='fzf --preview="bat --color=always --style=header,grid --line-range :500 {}"'
alias fzf_nvim='nvim $(fzf_bat)'
#alias fzf_kill='pids=$(ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | sed 1d | fzf -m | awk "{print \$1}"); [ -n "$pids" ] && kill $pids'

alias sqlite3='sqlite3 -box'

#alias mupdf='devour mupdf'

alias vimdiff='nvim -d'



#alias news="newsboat"
#alias afk='make -C ~/Projects/afk'
#alias feh='feh --scale-down'
#alias k='kubectl'
#alias unzipdir='function _unzipdir() { unzip "$1" -d "${1%.zip}"; }; _unzipdir'

alias loop_ports_netstat='while true; do netstat -tulnp; sleep 3; clear; done'
alias loop_git_status='while true; do git status; sleep 3; clear; done'
alias git_hot_files='func_git_hot_files'


alias mkdir_timestamp='mkdir $(date +%Y%m%d%H%M%S)'
alias mkdir_date='mkdir $(date +%Y-%m-%d)'
alias mkdir_date_p='mkdir -p $(date +%Y/%m/%d)'
#alias mkmany='~/.config/bin/mkmany.py $!'

#alias todo='$EDITOR ~/todo.txt && sort -o ~/todo.txt ~/todo.txt'
#alias todo='$EDITOR ~/todo.txt'
#alias note='mkdir -p $NOTE_PATH && $EDITOR $NOTE_PATH/note_$(date +"%Y%m%d").txt'
#alias notes='mkdir -p $NOTE_PATH && cd $NOTE_LOCAL && ranger'
#alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#alias srcplot='~/Templates/srcplot.sh'
alias graphcall='~/.config/bin/graphcall.sh'
#alias pomodoro='python ~/Projects/pymodoro/main.py'
#alias doctex='~/Projects/docker_imgs/doctex/doctex.sh'
#alias fix_video='~/.config/bin/fix_video.sh'
#alias image_editor='drawing'

alias pacman_list="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pacman_search="pacman -Ss | paste -d '' - - | fzf --layout=reverse"
