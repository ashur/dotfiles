export EDITOR='mate_wait'
export LESSEDIT='mate -l %lm %f'
export PAGER=less
export LESS=-diMQsz-2
export GREP_OPTIONS='--exclude=\*.svn\*'  
<<<<<<< HEAD
export TOOLS=$HOME/Developer/Jenkins/tools
=======
export TOOLS=$HOME/Jenkins/tools
export LANG=en_US.UTF-8
>>>>>>> 26d0ccd43f6e6eaa85ca6318c132b79dab2d80bf

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR=nano
	export LESSEDIT=nano
else
	export EDITOR='mate_wait'
	export LESSEDIT='mate -l %lm %f'
fi