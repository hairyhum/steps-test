#!/bin/sh

set -e

## Get GHCR token from env
if [[ "${CONFIG_IMAGE_PASS}" != "" ]]; then
echo ${CONFIG_IMAGE_PASS} | docker login ${CONFIG_IMAGE_REPO} -u ${CONFIG_IMAGE_USER} --password-stdin 
fi

## Run kyverno apply with specified folder
set +e
out=$(/opt/bin/kyverno-cli apply ${CONFIG_POLICIES_DIR} --resources ${CONFIG_RESOURCES_DIR} --registry --detailed-results --table)
result=$?
set -e

failures=$(echo "${out}" | grep Fail) || true

if [[ "${failures}" != "" ]]; then
echo ::kargo::out::failures::${failures}
fi

exit $result