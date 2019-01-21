#!/bin/bash

echo "#### init.sh has started."

echo "Set number_of_replicas for all indices to 0"
curl --noproxy localhost -XPUT 'http://localhost:9200/_template/global' -H 'Content-Type: application/json' -d '{
 "index_patterns": ["*", ".*"],
 "order": 10,
 "settings": {
   "number_of_replicas": 0
 }
}' &> /dev/null


if  [ $? -ne 0 ]; then
  echo "ERROR: curl failed." 
else
  echo "Success" 
fi

echo "Delete all indicies that were created before the global template was uploaded"
#curl --noproxy localhost -XDELETE 'http://localhost:9200/_all' &> /dev/null

if  [ $? -ne 0 ]; then
  echo "ERROR: curl failed."
else
  echo "Success" 
fi

#echo "Initialize beats that are not already part of this stack"
#./setup/initializeBeats.sh

echo "#### init.sh has ended."
