# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Base16 Shell
BASE16_SCHEME="default"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias vi="vim"
alias vol="alsamixer"
alias redparis="redshift -l 48.864828:2.3207085 &"
alias killblue="sudo rfkill block bluetooth"
alias yupdate="yaourt -Syua"
alias tnew="tmux new -s"
alias tach="tmux attach -t"
alias bbye="sudo poweroff"
alias glog="glo --graph"
alias phpush="rm -rf ~/public_html/* && rm -rf ~/public_html/.* && cp -r . ~/public_html/"

# Simplon Village
alias sv21="ssh root@192.168.0.21"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
#source $HOME/.git-flow-completion.zsh

# User configuration
# source ~/.zlogin

export PATH="$PATH:/home/emak/.rvm/gems/ruby-2.1.1/bin:/home/emak/.rvm/gems/ruby-2.1.1@global/bin:/home/emak/.rvm/gems/ruby-2.0.0-p451/bin:/home/emak/.rvm/gems/ruby-2.0.0-p451@global/bin:/home/emak/.rvm/rubies/ruby-2.0.0-p451/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/emak/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/opt/android-studio/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Define vim as the pager
#export PAGER=/usr/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting