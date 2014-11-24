if [[ `uname` == 'Darwin' ]]; then
	export TOOLS=$HOME/Developer/Jenkins/tools
  
  # Don't set this or switching xcodes with xcode-select will not work
	# export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/
	alias build="$TOOLS/build/build.rb"
fi


