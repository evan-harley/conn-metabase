#!/bin/bash

set -euxo pipefail

echo "Deploying metabase to openshift $*"

cd helm
helm dep up
helm upgrade --install --atomic -f ./values.yaml "$@" ccbc-metabase . --timeout=8m0s
