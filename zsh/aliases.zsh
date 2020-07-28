alias reload!='. ~/.zshrc'

alias dirs="dirs -v"

function repos(){ repoPath="$HOME/src/repos/$1"; cd $repoPath }
function psman(){ rm /tmp/psman.*; man -t $@ > /tmp/psman.ps; pstopdf /tmp/psman.ps; open -a Preview /tmp/psman.pdf }
