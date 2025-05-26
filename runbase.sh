#!/bin/bash
IMAGE="$1"
shift
if [ -z "$IMAGE" ]; then
    echo "Usage: $0 <image> [<args>]"
    exit 1
fi

HOMEDIR=$(getent passwd "$USER" | cut -d: -f6)
if [ -z "$HOMEDIR" ]; then
    echo "Could not determine home directory for user $USER"
    exit 1
fi
HOMEDIR="$HOMEDIR/.good-enough-images"

source /etc/good-enough-images.conf
ALLWORKDIR="$include_workdir"
if [ -z "$ALLWORKDIR" ]; then
    ALLWORKDIR="$HOMEDIR/all"
fi

USES_PWD=0
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
        if [[ $line == *%PWD%* ]]; then
            USES_PWD=1
        fi
        line=$(echo "$line" | sed 's/^[ \t]*//;s/[ \t]*$//' | sed "s|%BASE%|$HOMEDIR|g" | sed "s|%PWD%|$(pwd)|g") # trim whitespace
        MOUNTPARAMS="$MOUNTPARAMS -v $line"
    done < "$MOUNTFILE"
fi

USERFILE=/opt/good-enough-images/configs/$IMAGE.user
RUN_UID=$(id -u)
if [ -f "$USERFILE" ]; then
    RUN_UID=$(cat "$USERFILE")
fi
# Use gh or env
IMAGE_FINAL="${OVERRIDE_IMAGE:-ghcr.io/paul1278/good-enough-images:$IMAGE}"
DEBUG_ECHO=""
if [ "$DEBUG" == "1" ]; then
    DEBUG_ECHO="echo"
fi
if [ "$USES_PWD" -eq 1 ]; then
    WORKDIR=/pwd
else
    WORKDIR=/main
fi
$DEBUG_ECHO sudo docker run --rm -i -t --network host --workdir $WORKDIR \
    -v $ALLWORKDIR:/main \
    --user $RUN_UID:$RUN_UID \
    $MOUNTPARAMS \
    $IMAGE_FINAL "$@"
