#!/bin/bash 

vim -E -s -c "source ~/.vimrc" -c "PlugInstall --sync" -c qa &> /dev/null < /dev/tty
