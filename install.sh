#!/bin/bash

for file in `find ~/.dotfiles/system`
do
	[ -f $file ] && source $file
done
