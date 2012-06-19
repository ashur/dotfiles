export EDITOR='mate_wait'
export LESSEDIT='mate -l %lm %f'
export PAGER=less
export LESS=-diMQsz-2
export GREP_OPTIONS='--exclude=\*.svn\*'  
export TOOLS=$HOME/Jenkins/tools

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR=nano
	export LESSEDIT=nano
else
	export EDITOR='mate_wait'
	export LESSEDIT='mate -l %lm %f'
fi