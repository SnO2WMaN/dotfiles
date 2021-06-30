# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# default tool variables
export TERMINAL="terminator"
export BROWSER="google-chrome-stable"
export EDITOR="vim"
export IDE="code"
export FILER="ranger"

# scripts loading
export SCRIPTS_DIR="~/.scripts.d"
for file in `ls $SCRIPTS_DIR -1AF`; do
  source "$SCRIPTS_DIR/${file}"
done

# keybinding
zle -N projects
bindkey '^]' projects

# aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

autoload -Uz compinit && compinit -i

source <(direnv hook zsh)
source <(starship init zsh --print-full-init)
[[ -f "/opt/asdf-vm/asdf.sh" ]] && source /opt/asdf-vm/asdf.sh
[[ -f "~/.cargo/env" ]] && source ~/.cargo/env
[[ -f "~/.ghcup/env" ]] && source ~/.ghcup/env
