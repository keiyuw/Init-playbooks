autoload -Uz compinit && compinit
autoload -Uz colors && colors

setopt prompt_subst
if [ -e ~/.zsh_bundle.sh ]; then
	source ~/.zsh_bundle.sh
fi
if [ -e ~/.zsh_theme ]; then
	source ~/.zsh_theme
fi

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# HOME + END
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
case $TERM in (xterm*)
    bindkey '\eOH' beginning-of-line
    bindkey '\eOF' end-of-line
esac
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# DEL + PGDN + INS
bindkey '\e[3~' delete-char
bindkey '\e[6~' end-of-history
bindkey '\e[2~' redisplay

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

export EDITOR=vim
export GPG_TTY=$(tty)
export PAGER=less
export SSH_KEY_PATH=$HOME/.ssh/id_rsa

alias tmux="TERM=xterm-256color tmux"
alias ssh="TERM=xterm-256color ssh"
alias ls="ls --color"

if [ -e ~/.zsh_custom ]; then
	source ~/.zsh_custom
fi
