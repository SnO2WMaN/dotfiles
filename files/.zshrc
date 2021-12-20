## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# default applications
export TERMINAL="alacritty"
export BROWSER="firefox-developer-edition"
export EDITOR="vim"
export FILER="ranger"

# bin.d
export PATH=~/.bin.d:$PATH

# aliases
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

# scripts loading
export SCRIPTS_DIR="${HOME}/.scripts.d"
for file in `/bin/ls -1 ${SCRIPTS_DIR}`; do
  source "$SCRIPTS_DIR/${file}"
done

## projects
zle -N projects

# zinit
source ~/.zinit/bin/zinit.zsh
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-history-substring-search

# autoload
autoload -U add-zsh-hook
autoload -Uz compinit && compinit -i
autoload -Uz colors && colors

source <(direnv hook zsh)
source <(starship init zsh --print-full-init)
[[ -f "/opt/asdf-vm/asdf.sh" ]] && source /opt/asdf-vm/asdf.sh
[[ -f "~/.cargo/env" ]] && source ~/.cargo/env
[[ -f "~/.ghcup/env" ]] && source ~/.ghcup/env
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source ~/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# dprint
export DPRINT_INSTALL="$HOME/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"

# VSCode
export PATH="$HOME/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin:$PATH"

# cargo
export CARGO_BIN="$HOME/.cargo/bin"
export PATH="$CARGO_BIN:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# keybinding
bindkey -e

bindkey '^[[A' history-substring-search-up # Up
bindkey '^[[B' history-substring-search-down # Down
bindkey '^[[D' backward-char # Left
bindkey '^[[C' forward-char # Right

bindkey '^[[1;2D' backward-word
bindkey '^[[1;2C' forward-word

bindkey '^[Od' backward-word # Ctrl+Left
bindkey '^[Oc' forward-word # Ctrl+Right
bindkey '^H' backward-kill-word # Ctrl+Backspace
bindkey '^]' projects # Ctrl+]

bindkey '^[[2~' overwrite-mode # Insert
bindkey '^[[3~' delete-char # Delete
bindkey '^[[5~' history-beginning-search-backward # PgUp
bindkey '^[[6~' history-beginning-search-forward # PgDn
bindkey '^[[7~' beginning-of-line # Home
bindkey '^[[8~' end-of-line # End
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo # Shift+Tab

# terminfo
zmodload zsh/terminfo

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
[[ "${terminfo[khome]}" != "" ]] && bindkey "${terminfo[khome]}" beginning-of-line
[[ "${terminfo[kend]}" != "" ]] && bindkey "${terminfo[kend]}" end-of-line

