#!/usr/bin/bash

#author: vastness

git clone https://github.com/nvm-sh/nvm.git ~/.nvm
cd ~/.nvm
git checkout v0.39.3
. ./nvm.sh
nvm install 16.3.0
nvm use 16.3.0
npm install -g gitmoji-cli
npm install -g tldr
