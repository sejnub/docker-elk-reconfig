#!/bin/bash

FILES_TO_BE_PROCESSED=$(find ../.)
OUTPUT_FOLDER=../../docker-elk



if ! [ -f $OUTPUT_FOLDER/README.md ]; then
  echo "ERROR: The folder "docker-elk" is not where I expected it. I exit."
  exit 1
else
  echo "INFO: The folder "docker-elk" is where I expected it. So let's go!"
fi

echo

for inputfile in $FILES_TO_BE_PROCESSED
do
  #echo "Potentially copying: '$inputfile' ..."
  
  outputfile=$OUTPUT_FOLDER/${inputfile#.././}
  #echo "outputfile = '$outputfile'"

  # take action on each file. $inputfile stores current file name
  if ! [ -f "$inputfile" ]; then
    : #echo "  $inputfile was no regular file. So it was not processed."
  elif [[ $inputfile =~ reconfig ]]; then
    : #echo "  $inputfile belongs to reconfig. So it was not processed."
  elif [[ $inputfile =~ \.git ]]; then
    : #echo "  $inputfile belongs to git. So it was not processed."
  else
    echo "  copying '$inputfile' to '$outputfile' ..."
    cp $inputfile $outputfile
  fi      
done









# This script applies the configuration to the checked out docker-elk repository.

# eof







