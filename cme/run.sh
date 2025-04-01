#!/bin/bash
PARAM="$@"
if [ -z "$PARAM" ]; then
    PARAM="bash"
fi
sudo docker run --rm -i -t --network host --workdir /main -v /opt/good-enough-images/cme:/root/.cme ghcr.io/paul1278/good-enough-images:cme $PARAM
