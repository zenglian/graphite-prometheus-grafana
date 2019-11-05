#!/bin/bash

NS="insight"
if [ "$#" -gt 0 ]
  then
     NS=$1
fi

kubectl -n $NS create configmap prom-cm --from-file=conf/graphite_mapping.conf --from-file=conf/prometheus.yml
kubectl -n $NS create -f graphite-deployment.yaml 
kubectl -n $NS create -f prometheus-deployment.yaml 
kubectl -n $NS create -f grafana-deployment.yaml 
kubectl -n $NS create -f graphite-service.yaml
kubectl -n $NS create -f prometheus-service.yaml
kubectl -n $NS create -f grafana-service.yaml

