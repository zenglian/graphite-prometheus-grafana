#!/bin/bash

grafana="localhost:3000"
if [ "$#" -gt 0 ]
  then
     grafana=$1
fi

upload(){
  curl --noproxy "*" -X POST --insecure -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: application/json" -d @$1 http://$grafana/$2
  echo
}


upload "datasource.json" "api/datasources"
upload "spark-overview.json" "api/dashboards/db"
upload "kafka-overview.json" "api/dashboards/db"

