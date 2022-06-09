#!/usr/bin/env bash

retries=0
while :
do
  if curl -sL --fail http://127.0.0.1:19669;
    then exit 0
  fi

  if [ $retries -gt 120 ];
    then exit 0
  fi

  docker ps
  
  sleep 2

  retries=$((retries+1))

  echo "check: ${retries}"
done

exit 1