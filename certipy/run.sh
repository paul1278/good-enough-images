#!/bin/bash
PARAM="$@"
if [ -z "$PARAM" ]; then
    PARAM="bash"
fi
sudo docker run --rm -i -t --network host --workdir /main -v /opt/good-enough-images/certipy:/main ghcr.io/paul1278/good-enough-images:certipy $PARAM
