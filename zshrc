# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting zsh-vi-mode) 

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'



# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias cdc='cd ~/code'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias k='kubectl'
alias tf='terraform'
alias tfa='terraform apply'
alias tfp='terraform plan'
alias lg='lazygit'

if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ "$(uname)" == "Darwin" ]]; then
  ssh-add > /dev/null 2>&1
fi
# Created by `pipx` on 2024-01-30 08:58:47
export PATH="$PATH:~/.local/bin"

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


loadSecrets2Env() {
 # Start gpg-agent
 if [ -f ~/.gnupg/gpg-agent.conf ]; then
  # Start gpg-agent if not running
   if ! pgrep -x "gpg-agent" > /dev/null; then
      eval $(gpg-agent --daemon)
   fi

  # Load the passphrase if not already loaded
  KEYGRIP=$(gpg --list-keys --with-keygrip | grep Keygrip | awk '{print $3}')
  if ! gpg-connect-agent "keyinfo --list" /bye | grep -q "$KEYGRIP"; then
    echo "Enter your GPG passphrase:"
    read -s PASSPHRASE
    echo "$PASSPHRASE" | gpg-preset-passphrase --preset "$KEYGRIP"
  fi
 fi
 
 # Fetch secrets from gopass and export them as environment variables
  if command -v gopass >/dev/null 2>&1; then
    export DOCKER_USERNAME=${DOCKER_USERNAME:-ofenbeck}
    export DOCKER_PASSWORD=${DOCKER_PASSWORD:-$(gopass show -o websites/docker.com/ofenbeck)}

    export MILL_SONATYPE_USERNAME=${MILL_SONATYPE_USERNAME:-$(gopass show -o websites/central.sonatype tokenUser)}
    export MILL_SONATYPE_PASSWORD=${MILL_SONATYPE_PASSWORD:-$(gopass show -o websites/central.sonatype tokenPassword)}
    export MILL_PGP_SECRET_BASE64=${MILL_PGP_SECRET_BASE64:-$(gopass show -o GPG/secret_base_64)}
  fi
}


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
autoload -U compinit && compinit

if command -v nvim >/dev/null 2>&1; then
  alias vim='nvim'
fi

export PATH="$PATH:/home/rayd/.local/share/coursier/bin"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"

#eval "$(starship init zsh)"
#export STARSHIP_CONFIG=~/.config/starship/starship.toml
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

