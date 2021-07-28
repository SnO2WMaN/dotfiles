TOOL_VERSION_FILE=~/.tool-versions

asdf plugin update --all

for plugin in `cat $TOOL_VERSION_FILE | cut -d ' ' -f 1`;
do
  version=`cat $TOOL_VERSION_FILE | grep $plugin | cut -d ' ' -f 2`
  asdf plugin add $plugin
  asdf install $plugin $version
done
