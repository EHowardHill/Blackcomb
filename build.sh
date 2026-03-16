#!/bin/bash

set -e

sudo find ./ -type f -iname "*.sh" -exec chmod +x {} \;
bluebuild generate-iso --iso-name blackcomb.iso --tempdir ./local-tmp recipe ./recipe.yml