#!/bin/sh
docker run -v "$(pwd)/src:/src" -i -t --rm ts_to_go:latest
if [ -f src/main ]; then
  echo 'Compilation succeeded.'
  mv -f src/main ./main
  ls -al --color=auto -F ./main
else
  echo 'Compilation failed.'
fi
