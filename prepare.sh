#!/bin/bash

# Download the package corresponding to VERSION and unpack it
source ./variables

echo "Retrieving $DOWNLOAD"...
curl -L -O $DOWNLOAD
mv "$FILENAME" "$PACKAGE/files/apps/duplicacy/bin/duplicacy"
chmod +x "$PACKAGE/files/apps/duplicacy/bin/duplicacy"
