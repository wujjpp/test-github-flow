#!/usr/bin/env bash

retries=0
while :
do
  if curl -sL --fail http://127.0.0.1:19669;
    then exit 0
  fi

  docker logs nebula-up_storaged0_1

  if [ $retries -gt 120 ];
    then exit 0
  fi

  sleep 2

  retries=$((retries+1))

  echo "check: ${retries}"
done

exit 1