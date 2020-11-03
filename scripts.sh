#!/bin/bash

if [ $1 = 'lemp' ]; then
  source ./scripts/lemp.sh
else
  echo -e 'Scripts! Available commands:\n'
  echo -e 'lemp     | Start LEMP stack services\n'
fi
