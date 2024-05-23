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


certbot certonly --nginx -d $NGINX_DOMAIN --staple-ocsp -m $CERT_EMAIL --agree-tos
