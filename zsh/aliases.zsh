alias reload!='. ~/.zshrc'
alias repos='cd ~/Documents/repos'

function psman(){ rm /tmp/psman.*; man -t $@ > /tmp/psman.ps; pstopdf /tmp/psman.ps; open -a Preview /tmp/psman.pdf }
