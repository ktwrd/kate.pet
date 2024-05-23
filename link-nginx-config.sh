#!/bin/bash
if [ ! -f ".env" ]; then
    echo "no .env file found!"
    exit 1
fi

while read -r LINE; do
    if [[ $LINE == *'='* ]] && [[ $LINE != '#'* ]]; then
        ENV_VAR="$(echo $LINE | envsubst)"
        eval "declare $ENV_VAR"
    fi
done < .env

if [ ! -f $NGINX_CONF ]; then
    echo "could not find $NGINX_CONF"
    exit 1
fi

_target_file="./nginx.current.conf"

if [ ! -f "$_target_file" ]; then
    echo "creating symlink between $NGINX_CONF and $_target_file"
    ln -s $NGINX_CONF $_target_file
    exit 0
fi
echo "target file $_target_file already exist"