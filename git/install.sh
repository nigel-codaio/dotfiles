#!/bin/sh

brew ls --versions github/gh/gh || (echo "Installing gh" && brew install github/gh/gh)
