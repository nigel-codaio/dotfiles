alias reload!='. ~/.zshrc'

function psman(){ rm /tmp/psman.*; man -t $@ > /tmp/psman.ps; pstopdf /tmp/psman.ps; open -a Preview /tmp/psman.pdf }
