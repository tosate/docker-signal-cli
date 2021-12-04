#!/bin/bash

OWNER=AsamK
REPO=signal-cli
API_URL=https://api.github.com/repos/${OWNER}/${REPO}/releases/latest
TAG_NAME=`curl --silent "${API_URL}" | jq -r '.tag_name'`
echo "Latest version: ${TAG_NAME}"
ASSET=`curl --silent "${API_URL}" | jq -r '.assets[0].name'`
echo "Downloading ${ASSET}"
ASSET_URL=`curl --silent "${API_URL}" | jq -r '.assets[0].browser_download_url'`

wget ${ASSET_URL}