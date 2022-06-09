#!/usr/bin/env bash

retries=0
while :
do
  retries=$((retries+1))

  if curl -sL --fail http://127.0.0.1:19669;
    then break
  fi

  if [ $retries -gt 120 ];
    then break
  fi

  sleep 1

  echo "retries=${retries}"
done