#!/usr/bin/env bash

retries=0
while :
do
  if curl -sL --fail http://127.0.0.1:19669;
    then break
  fi

  docker-compose ps

  if [ $retries -gt 120 ];
    then break
  fi

  sleep 2

  retries=$((retries+1))

  echo "check: ${retries}"
done