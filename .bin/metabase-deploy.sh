#!/bin/bash

set -euxo pipefail

echo "Deploying metabase to openshift $*"

cd helm
helm dep up
helm upgrade --install --atomic -f ./values.yaml --set livenessProbe.tcpSocket.port=3000 --set livenessProbe.httpGet=null --set readinessProbe.httpGet=null "$@" ccbc-metabase . --timeout=8m0s
