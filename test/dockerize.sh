#! /bin/bash
script_dir=$(dirname $0)
docker build --rm -t "vpsupper" $script_dir/../
docker run -it vpsupper