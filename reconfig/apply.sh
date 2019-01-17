#!/bin/bash

OUTPUT_FOLDER=../../docker-elk

#FILES_AND_FOLDERS_TO_BE_DELETED="docker-stack.yml .travis.yml LICENSE extensions/apm-server .git .github .gitattributes"
FILES_AND_FOLDERS_TO_BE_DELETED=""
#FILES_TO_BE_COPIED=$(find ../.)
FILES_TO_BE_COPIED=""


echo "#### apply.sh has started."


if ! [ -f $OUTPUT_FOLDER/README.md ]; then
  echo "ERROR: The folder "docker-elk" is not where I expected it. I exit."
  exit 1
else
  echo "INFO: The folder "docker-elk" is where I expected it. So let's go!"
fi


for inputfile in $FILES_AND_FOLDERS_TO_BE_DELETED
do
  outputfile=$OUTPUT_FOLDER/$inputfile

  if [ -f "$outputfile" ]; then
    echo "  deleting the file '$outputfile' ..."
    rm $outputfile
  elif [ -d "$outputfile" ]; then
    echo "  deleting the folder '$outputfile' ..."
    rm -rf $outputfile
  else
    echo " not deleting '$outputfile' because it's neither regular file nor folder."
  fi      
done


for inputfile in $FILES_TO_BE_COPIED
do  
  outputfile=$OUTPUT_FOLDER/${inputfile#.././}

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

