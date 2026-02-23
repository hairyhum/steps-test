#!/bin/sh

set -e
set -u

## Get GHCR token from env

echo ${CONFIG_IMAGE_PASS} | docker login ${CONFIG_IMAGE_REPO} -u ${CONFIG_IMAGE_USER} --password-stdin 

## Run kyverno apply with specified folder

/opt/bin/kyverno-cli apply ${CONFIG_POLICIES_DIR} --resources ${CONFIG_RESOURCES_DIR} --registry --detailed-results --table