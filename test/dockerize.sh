#!/bin/bash
script_dir=$(dirname $0)
docker build --rm -t bahadircyildiz/vpsupper $script_dir/../
docker run -it --privileged bahadircyildiz/vpsupper