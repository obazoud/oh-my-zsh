# local/bin
if [ -d ~/local/bin ]; then
  PATH="~/local/bin:$PATH"
fi

# MAVEN
if [ -d /usr/local/apache-maven/bin ]; then
  PATH="$PATH:/usr/local/apache-maven/bin"
  export MAVEN_OPTS="-Xms40m -Xmx768m -XX:MaxPermSize=192m -XX:+CMSClassUnloadingEnabled -XX:-UseGCOverheadLimit -Dmaven.artifact.threads=10"
  export M2_HOME=/usr/local/apache-maven
  export MAVEN_COLOR=""
fi

