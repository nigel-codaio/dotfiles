#!/bin/sh

brew ls --versions ruby-install || (echo "Installing ruby-install" && brew install ruby-install)
brew ls --versions chruby || (echo "Installing chruby" && brew install chruby)
