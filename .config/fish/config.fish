# exported variables
set -x ANDROID_HOME $HOME/Android/Sdk
set -x ANDROID_SDK_ROOT $ANDROID_HOME

# path
set PATH $PATH $HOME/bin
set PATH $PATH $ANDROID_HOME/emulator
set PATH $PATH $ANDROID_HOME/tools
set PATH $PATH $ANDROID_HOME/tools/bin
set PATH $PATH $ANDROID_HOME/platform-tools

# load functions
for defns in (ls $HOME/.config/fish/functions/*.fish)
  source $defns
end
