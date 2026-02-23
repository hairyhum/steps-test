FROM ghcr.io/kyverno/kyverno-cli:latest AS kcli

## Using an image with a shell
FROM alpine:latest

RUN apk update && apk add --no-cache docker-cli

## Grab kyverno cli binary
COPY --from=kcli --chmod=+x /ko-app/kubectl-kyverno /opt/bin/kyverno-cli

## Script to run apply
COPY --chmod=+x kyverno.sh kyverno.sh


