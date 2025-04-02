#!/bin/bash
PARAM="$@"
if [ -z "$PARAM" ]; then
    PARAM="bash"
fi
sudo docker run -i -t --rm --network host -v /opt/good-enough-images/msf:/root/.msf4 -v /opt/good-enough-images/msf/workdir:/main ghcr.io/paul1278/good-enough-images:msf $PARAM