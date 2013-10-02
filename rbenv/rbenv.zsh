ruby-install() {
	
	brew tap homebrew/versions
	brew install ruby-build gcc43
	rehash
	
	local VERSION="$1"
	if [ -z "$VERSION" ]; then
		echo "ruby-install: Specify the version of Ruby you want to install."
		echo
		echo "Available rubies:"
		ruby-build --definitions
		return 1
	fi
	brew update
	brew install rbenv ruby-build rbenv-vars readline openssl ctags
	brew upgrade rbenv ruby-build rbenv-vars readline openssl ctags

	eval "$(rbenv init - --no-rehash)" # load rbenv in the current shell
	export SSL_CERT_FILE="/usr/local/etc/openssl/certs/cert.pem"
	if ! [[ -e "$SSL_CERT_FILE" ]]; then
		curl -o "$SSL_CERT_FILE" http://curl.haxx.se/ca/cacert.pem
	fi
	export CONFIGURE_OPTS="--disable-install-doc --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)"
	rbenv install $VERSION
	export RBENV_VERSION="$VERSION"
	gem install --no-ri --no-rdoc bundler rbenv-rehash git-up hitch gem-browse cheat awesome_print pry colorize

	echo "To make $VERSION your default Ruby, run the following:"
	echo
	echo "    rbenv global $VERSION"
}

if [[ `uname` == 'Darwin' ]]; then
  export RBENV_ROOT=/usr/local/var/rbenv
else
#  export RBENV_ROOT=/usr/local/var/rbenv
  export PATH=$HOME/.rbenv/bin::$PATH
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
