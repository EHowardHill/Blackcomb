#!/bin/bash

sudo apt update
sudo apt install podman -y

bash <(curl -s https://raw.githubusercontent.com/blue-build/cli/main/install.sh)