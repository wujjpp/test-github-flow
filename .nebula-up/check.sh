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

  docker-compose ps

  echo "==============================="
  ls -alh ./data
  ls -alh ./logs/storage0
  cat ./logs/storage0/storaged-stderr.log
  echo "==============================="
  cat ./logs/storage0/nebula-storaged.ERROR
  
  sleep 10

  retries=$((retries+1))

  echo "check: ${retries}"
done

exit 1