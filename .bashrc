#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias neofetch='fastfetch'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

dotfile_opts="--git-dir=$HOME/.config/.dotfiles/ --work-tree=$HOME"
alias dotfiles='/usr/bin/git $dotfile_opts'
alias dflazy='/usr/bin/lazygit $dotfile_opts'

PS1='[\u@\h \W]\$ '

function current_command {
  local history_line
  history_line="$(history 1)"
  echo "${history_line##*([[:space:])+([[:digit:]])+([[:space:]])}"
}
PS0='\[\e]0;$(current_command)\a\]'

# https://codeberg.org/dnkl/foot/wiki#user-content-spawning-new-terminal-instances-in-the-current-working-directory
osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd

fav() {
  local cmd
  cmd=$(fzf < ~/.config/bash/favcmds.sh) || return
  READLINE_LINE=$cmd
  READLINE_POINT=${#cmd}
}
bind -x '"\C-f": fav'
