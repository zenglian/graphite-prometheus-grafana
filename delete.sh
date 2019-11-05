#!/bin/bash

NS="insight"
if [ "$#" -gt 0 ]
  then
     NS=$1
fi

kubectl -n $NS delete svc -l group=gpg
kubectl -n $NS delete deploy -l group=gpg
                     
