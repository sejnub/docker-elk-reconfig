#!/bin/bash

echo "#### init.sh has started."

echo "Set number_of_replicas for all indices to 0"
curl --noproxy localhost -XPUT 'http://localhost:9200/_template/docker-elk-no-replicas' -H 'Content-Type: application/json' -d '{
  "index_patterns": ["*", ".*"],
  "order": 10,
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0
  }
}' &> /dev/null


if  [ $? -ne 0 ]; then
  echo "ERROR: curl failed." 
else
  echo "Success" 
fi


# TODO: This does not work. Maybe delete the named volume with esdata at first start (and only at first start). Hmm no the solution is not that simple.


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
