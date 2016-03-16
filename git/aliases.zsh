alias git=hub
alias gitoneline="git log --graph --decorate --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitonelineall="git log --graph --decorate --all --pretty=format:\"%C(auto)%h%d %Cblue%an%Creset: %C(auto)%s\""
alias gitpretty="git log --graph --decorate --name-status"
alias gitprettyall="git log --graph --decorate --name-status --all"
alias gitreset="git reset HEAD\^" # convenience function to go back one commit
alias gitpush="git push origin HEAD"
alias gitwip="git commit -a -m 'WIP DO NOT COMMIT'"

function gitmergecommit() { git log $1..HEAD --ancestry-path --merges }
function gitmerged() { git branch --merged $@ | sed -e '/^*/d' }
function gitcleanup() { echo "$(gitmerged)" | xargs -n 1 git branch -d; git remote prune origin }
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

function gitupdatebases() {
	git fetch origin
	basis_branches=('master' 'develop' 'rc')
	for branch in $basis_branches; do
		# verify it exists
		git show-ref --verify --quiet refs/heads/"$branch"
		if [ $? -ne 0 ]; then
			continue
		fi

		# verify it can be fast forwarded
		git merge-base --is-ancestor "$branch" origin/"$branch"
		if [ $? -ne 0 ]; then
			echo "$branch cannot be fast-forwarded to origin/$branch, you'll need to manually update your branch"
			continue
		fi

		# Change the branch ref to point to the new one
		echo "Updating $branch to origin/$branch"
		git update-ref refs/heads/"$branch" origin/"$branch"
	done
}
