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
export BROWSER="firefox-developer-edition"
export EDITOR="vim"
export IDE="code"
export FILER="ranger"

# aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# scripts loading
export SCRIPTS_DIR="${HOME}/.scripts.d"
for file in `/bin/ls -1 ${SCRIPTS_DIR}`; do
  source "$SCRIPTS_DIR/${file}"
done

# keybinding
zle -N projects
bindkey '^]' projects

autoload -Uz compinit && compinit -i

source <(direnv hook zsh)
source <(starship init zsh --print-full-init)
[[ -f "/opt/asdf-vm/asdf.sh" ]] && source /opt/asdf-vm/asdf.sh
[[ -f "~/.cargo/env" ]] && source ~/.cargo/env
[[ -f "~/.ghcup/env" ]] && source ~/.ghcup/env
