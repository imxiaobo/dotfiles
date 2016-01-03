export CLICOLOR=1
eval `gdircolors ~/.dir_colors`
export GREP_OPTIONS='--color=auto'
export LS_OPTIONS='--color=auto'
alias ls='gls $LS_OPTIONS -hF'
alias ll='gls $LS_OPTIONS -lhF'
alias l='gls $LS_OPTIONS -lAhF'
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

