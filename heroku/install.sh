#!/bin/sh

if test ! $(which heroku)
then
	echo "  Installing heroku for you."
	brew install heroku-toolbelt > /tmp/rbenv-install.log
fi

