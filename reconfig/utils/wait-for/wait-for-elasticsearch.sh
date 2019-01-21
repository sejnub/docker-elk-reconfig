#!/bin/bash

echo "#### wait-for-elasticsearch.sh has started."

returncode=-1
while [ "$returncode" -ne 0 ]
do
  curl -XGET http://localhost:9200/_cluster/health?pretty --connect-timeout 300 &> /dev/null
  returncode=$?
  sleep 1
done

echo "#### wait-for-elasticsearch.sh has ended."
