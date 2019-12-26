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

# gpg alias
alias gpg='gpg2'

# Base16 Shell
if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

set -x EDITOR vim
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/code/gocode
set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $HOME/Android/Sdk

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $GOPATH/bin $GOROOT/bin $PATH
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools
set PATH $PATH /opt/gradle/gradle-4.9/bin

rbenv rehash >/dev/null ^&1

# SSH x GPG config
set -Ux GPG_TTY (tty)
set -Ux SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

## https://github.com/lrvick/security-token-docs/blob/master/Use_Cases/SSH.md
## If connected locally
#if [ -z "$SSH_TTY" ]
#  # setup local gpg-agent with ssh support and save env to fixed location
#  # so it can be easily picked up and re-used for multiple terminals
#  set -l envfile "$HOME/.gnupg/gpg-agent.env"
#  if [ ! -e "$envfile" \
#     -o \( \
#       # deal with changed socket path in gnupg 2.1.13
#       ! -e "$HOME/.gnupg/S.gpg-agent" \
#       -a ! -e "/var/run/user/(id -u)/gnupg/S.gpg-agent" \) ]
#    killall gpg-agent
#    gpg-agent --daemon --enable-ssh-support > $envfile
#  end
#  # Get latest gpg-agent socket location and expose for use by SSH
#  eval "cat $envfile" ; set -x SSH_AUTH_SOCK $SSH_AUTH_SOCK
#  # Wake up smartcard to avoid races
#  gpg --card-status > /dev/null 2>&1
#else
#  # Copy gpg-socket forwarded from ssh to default location
#  # This allows local gpg to be used on the remote system transparently.
#  # Strongly discouraged unless GPG managed with a touch-activated GPG
#  # smartcard such as a Yubikey 4.
#  # Also assumes local .ssh/config contains host block similar to:
#  # Host someserver.com
#  #     ForwardAgent yes
#  #     StreamLocalBindUnlink yes
#  #     RemoteForward /home/user/.gnupg/S.gpg-agent.ssh /home/user/.gnupg/S.gpg-agent
#  if [ -e "$HOME/.gnupg/S.gpg-agent.ssh" ]
#    mv $HOME/.gnupg/S.gpg-agent{.ssh,}
#  else if [ -e "/var/run/user/(id -u)/gnupg/S.gpg-agent" ]
#    mv /var/run/user/(id -u)/gnupg/S.gpg-agent{.ssh,}
#  end
#  # Ensure existing sessions like screen/tmux get latest ssh auth socket
#  # Use fixed location updated on connect so in-memory location always works
#  if [ ! -z "$SSH_AUTH_SOCK" -a \
#       "$SSH_AUTH_SOCK" != "$HOME/.ssh/agent_sock" ]
#    unlink "$HOME/.ssh/agent_sock" 2>/dev/null
#    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/agent_sock"
#  end
#  set -x SSH_AUTH_SOCK "$HOME/.ssh/agent_sock"
#end
