#!/bin/bash

FILES_AND_FOLDERS_TO_BE_DELETED="docker-stack.yml .travis.yml LICENSE extensions/apm-server"

echo "#### apply.sh has started."

FILES_TO_BE_COPIED=$(find ../.)
OUTPUT_FOLDER=../../docker-elk


if ! [ -f $OUTPUT_FOLDER/README.md ]; then
  echo "ERROR: The folder "docker-elk" is not where I expected it. I exit."
  exit 1
else
  echo "INFO: The folder "docker-elk" is where I expected it. So let's go!"
fi




for inputfile in $FILES_AND_FOLDERS_TO_BE_DELETED
do
  
  outputfile=$OUTPUT_FOLDER/$inputfile
  echo "Potentially deleting: '$outputfile' ..."

  # take action on each file. $inputfile stores current file name
  if [ -f "$outputfile" ]; then
    echo "  deleting the file '$outputfile' ..."
    rm -$outputfile
  elif [ -d "$outputfile" ]; then
    echo "  deleting the folder '$outputfile' ..."
    rm -rf -$outputfile
  else
    echo " not deleting '$outputfile' because it's neither regular file nor folder."
  fi      
done




for inputfile in $FILES_TO_BE_COPIED
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


echo "#### apply.sh has ended."

