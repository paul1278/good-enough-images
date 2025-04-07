#!/bin/bash
IMAGE="$1"
shift
if [ -z "$IMAGE" ]; then
    echo "Usage: $0 <image> [<args>]"
    exit 1
fi

source /etc/good-enough-images.conf
ALLWORKDIR="$include_workdir"
if [ -z "$ALLWORKDIR" ]; then
    ALLWORKDIR="/opt/good-enough-images/workdir/all"
fi

PARAM="$@"
if [ -z "$PARAM" ]; then
    PARAM="bash"
fi

MOUNTFILE=/opt/good-enough-images/configs/$IMAGE.mount
MOUNTPARAMS=""
if [ -f "$MOUNTFILE" ]; then
    while IFS= read -r line || [ "$line" ]; do
        if [[ $line == \#* ]]; then
            continue
        fi
        if [ -z "$line" ]; then
            continue
        fi
        line=$(echo "$line" | sed 's/^[ \t]*//;s/[ \t]*$//' | sed 's|%BASE%|/opt/good-enough-images/workdir|g') # trim whitespace
        MOUNTPARAMS="$MOUNTPARAMS -v $line"
    done < "$MOUNTFILE"
fi

sudo docker run --rm -i -t --network host --workdir /main \
    -v $ALLWORKDIR:/main \
    $MOUNTPARAMS \
    ghcr.io/paul1278/good-enough-images:$IMAGE $PARAM
