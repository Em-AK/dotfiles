# git aliases
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gds="git diff --staged"
alias gfo='git fetch origin'
alias gl='git pull'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --graph'
alias gp='git push'
alias gr='git remote'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbm='git rebase master'
alias gst='git status'

# tmux aliases
alias tnew="tmux new -s"
alias tach="tmux attach -t"

# Base16 Shell
if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

set -x EDITOR vim
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/code/gocode
set -x ANDROID_HOME $HOME/Android/Sdk

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $GOPATH/bin $GOROOT/bin $PATH
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH $PATH /opt/gradle/gradle-4.9/bin

rbenv rehash >/dev/null ^&1
