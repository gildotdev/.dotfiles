
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# pnpm
export PNPM_HOME="/Users/gilcreque/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"

export EDITOR='nvim'

# Only load 1password agent when not in an SSH session
if [[ -z "$SSH_CLIENT" && -z "$SSH_TTY" ]]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
fi

# Load Angular CLI autocompletion.
autoload -Uz compinit && compinit
source <(ng completion script)

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

source $HOME/.dotfiles/.aliases
source $HOME/.dotfiles/.functions

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/bin/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/bin/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/bin/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/bin/google-cloud-sdk/completion.zsh.inc"; fi

# Only load secrets when not in an SSH session
if [[ -z "$SSH_CLIENT" && -z "$SSH_TTY" ]]; then
  op inject --in-file "$HOME/.dotfiles/secrets.zsh" | while read -r line; do
    eval "$line"
  done
fi

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# deno
export PATH="$HOME/.deno/bin:$PATH"

# docker
export DOCKER_HOST=unix:///var/run/docker.sock

# dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Created by `pipx` on 2025-09-18 16:52:03
export PATH="$PATH:$HOME/.local/bin"

# Added by Antigravity
export PATH="/Users/gilcreque/.antigravity/antigravity/bin:$PATH"

# VSCode shell integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# bun completions
[ -s "/Users/gilcreque/.bun/_bun" ] && source "/Users/gilcreque/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/gilcreque/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Postgres Tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Home directory binaries
export PATH="$HOME/bin:$PATH"