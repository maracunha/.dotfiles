#!/usr/bin/env bash

if [[ -f '.nvmrc' ]]
then
    . ~/.nvm/nvm.sh
    nvm use
fi
