
alias gitoneline="git log --graph --decorate --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitonelineall="git log --graph --decorate --all --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitpretty="git log --graph --decorate --name-status"
alias gitprettyall="git log --graph --decorate --name-status --all"
alias gitreset="git reset HEAD\^" # convenience function to go back one commit

function gitmerged() { git branch --merged $@ | sed -e '/^*/d' }
function gitcleanup() { git branch -d $(gitmerged) }
function gitshowsvn() { git show `git svn find-rev r$1` }
function gitsvnrebase() {
	if [[ $1 != "-l" ]]; then
		git svn fetch;
	fi
	git for-each-ref --shell --format='git co %(refname:short); git svn rebase -l;' refs/heads | \
		while read entry
		do
			eval "$entry"
		done
}
