# Set of functions designed to calculate the current git branch and put it into an environment variable.
# Used in my prompt definitions
function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

git_compute_branch() {
	export __CURRENT_GIT_BRANCH="$(parse_git_branch)"
	export __CURRENT_GIT_BRANCH_INVALID=
}

git_invalidate_branch() {
	export __CURRENT_GIT_BRANCH_INVALID=1
}

__CURRENT_GIT_BRANCH="$(parse_git_branch)"

typeset -ga chpwd_functions
typeset -ga preexec_functions

preexec_functions+='preexec_update_git_branch'
preexec_update_git_branch() {
	case $2 in 
		git*) git_invalidate_branch
	esac
}

chpwd_functions+='chpwd_update_git_branch'
chpwd_update_git_branch() {
	git_invalidate_branch
}

git_get_branch() {
	test -n "$__CURRENT_GIT_BRANCH_INVALID" && git_compute_branch
	echo $__CURRENT_GIT_BRANCH
}
