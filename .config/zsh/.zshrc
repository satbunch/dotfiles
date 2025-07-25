# Aliases
alias vi="nvim"
alias vim="nvim"
alias view="nvim -r"
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Lazygit
lg()
{
  lazygit "$@"
}

# install nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# 補完機能を有効にする
autoload -Uz compinit && compinit

# 小文字でも大文字ディレクトリ、ファイルを補完できるようにする
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# init starship
eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
