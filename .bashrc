#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias neofetch='fastfetch'

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
