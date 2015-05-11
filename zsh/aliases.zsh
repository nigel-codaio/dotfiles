alias reload!='. ~/.zshrc'

function repos(){ repoPath="$HOME/Documents/repos/$1"; cd $repoPath }
function psman(){ rm /tmp/psman.*; man -t $@ > /tmp/psman.ps; pstopdf /tmp/psman.ps; open -a Preview /tmp/psman.pdf }
