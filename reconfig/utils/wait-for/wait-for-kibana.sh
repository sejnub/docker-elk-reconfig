#!/bin/bash

returncode=-1
while [ "$returncode" -ne 0 ]
do
  curl -XGET http://localhost:5601/api/status --connect-timeout 300 &> /dev/null
  returncode=$?
  sleep 1
done
