#!/bin/bash
set -x
set -euo pipefail
kubectl create configmap logstash-crab --from-file=logstash.conf --from-file logstash.yml --dry-run=client -oyaml | kubectl apply -f -
kubectl delete pod $(kubectl get pod --no-headers -o custom-columns=":metadata.name" | grep logstash)
