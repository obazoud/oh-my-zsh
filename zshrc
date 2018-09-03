DISABLE_AUTO_UPDATE="true"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="olivier"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(aws git mvn svn github node npm nvm heroku grails ruby rails gem vagrant knife knife_ssh )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

unsetopt share_history
unsetopt inc_append_history

maven_plugins=(dependency help hibernate3 jetty tomcat6 tomcat7 versions)
zstyle ':completion:*:mvn:*' plugins $maven_plugins

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JAVA_HOME=/opt/java/default
PATH=$PATH:$JAVA_HOME/bin

export M2_HOME=/opt/maven/default
PATH=$PATH:$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m -XX:MaxPermSize=192m -XX:+CMSClassUnloadingEnabled"

export GRADLE_HOME=/opt/gradle/default
PATH=$PATH:$GRADLE_HOME/bin

PATH=$PATH:/usr/local/bin:/usr/local
PATH=$PATH:/home/obazoud/bin/
PATH=$PATH:/usr/local/go/bin

alias java='nocorrect java'

if [ -f "$HOME/.zshrc-ec2" ]; then
    source $HOME/.zshrc-ec2
fi

[[ -s "$HOME/.gvm/scripts/gvm" ]] && . "$HOME/.gvm/scripts/gvm"

export KITCHEN_SYNC_MODE="rsync"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /home/obazoud/.travis/travis.sh ] && source /home/obazoud/.travis/travis.sh
