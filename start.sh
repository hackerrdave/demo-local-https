#!/bin/bash

set -e

# Note: update /etc/hosts separately, may require sudo privileges

# Install mkcert, assumes brew already installed
brew install mkcert

# Initialize and create certificates
mkcert -install
mkdir -p certs
mkcert -key-file certs/ssl.key -cert-file certs/ssl.crt myapp.local

# Run docker containers as daemons
docker-compose up -d

# Open default browser to https://myapp.local
open https://myapp.local