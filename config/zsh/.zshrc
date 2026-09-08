# Path
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# Alias
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias vi='nvim'
alias vim='nvim'
alias ls='eza'
alias la='eza -a'
alias ll='eza -la'
alias cat='bat'

# Lazygit
lg()
{
  lazygit "$@"
}

# autosuggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# fast syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History search with arrow keys #####
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search


# Editor
export EDITOR=nvim
export VISUAL=nvim

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# タブ補完機能を有効にする
autoload -Uz compinit && compinit

# 小文字入力時に大文字を含めた補完をする
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# init starship
eval "$(starship init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ghq + peco
function ghq-peco() {
  local dir=$(ghq list | peco)
  if [ -n "$dir" ]; then
    cd $(ghq root)/$dir
  fi
}
bindkey -s '^g' 'ghq-peco\n' # Ctrl+G で起動

# zoxide
eval "$(zoxide init zsh)"

# direnv
eval "$(direnv hook zsh)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"
