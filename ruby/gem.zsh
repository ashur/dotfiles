if [[ -n $LINUX ]]; then
	export GEM_HOME="$HOME/.gems"                           
	export GEM_PATH="$GEM_HOME:/usr/lib/ruby/gems/1.8"
fi
