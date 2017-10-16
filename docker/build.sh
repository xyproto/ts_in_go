#!/bin/sh
if [ "$1" == "rebuild" ]; then
  OPT="--no-cache"
fi
docker build $OPT -t ts_to_go:latest .
