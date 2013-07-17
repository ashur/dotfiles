if [[ `uname` == 'Darwin' ]]; then
	export TOOLS=$HOME/Developer/Jenkins/tools
	export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/
fi

alias build="$TOOLS/build/build.rb"
