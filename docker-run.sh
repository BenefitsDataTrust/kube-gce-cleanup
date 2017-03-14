#!/bin/bash
# Loop forever, running cleanup every $INTERVAL

set -eo pipefail

INTERVAL="${INTERVAL:-6h}"

# NOTE this only works with JSON files, not p12
if [[ -n "$GOOGLE_APPLICATION_CREDENTIALS" ]]; then
    gcloud auth activate-service-account "--key-file=$GOOGLE_APPLICATION_CREDENTIALS"
fi

while true; do
    echo "Executing delete-delete-orphaned-kube-network-load-balancers.sh @ $(date)"

    bash /delete-orphaned-kube-network-load-balancers.sh

    echo "Sleeping for $INTERVAL"
    sleep "$INTERVAL"
done
