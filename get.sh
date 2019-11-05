#!/bin/bash

NS="insight"
if [ "$#" -gt 0 ]
  then
     NS=$1
fi

kubectl -n $NS get pod,svc -l group=gpg
