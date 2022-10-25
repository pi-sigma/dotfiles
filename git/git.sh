#!/bin/bash

git="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config/tig/
ln -sf $git/.gitconfig ~
ln -sf $git/.gitignore ~
ln -sf $git/.tig ~/.config/tig/config
