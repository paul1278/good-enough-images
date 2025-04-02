#!/bin/bash
cd `dirname $0`/workflows
rm ./build-*.yml 2> /dev/null

for dir in ../../*/; do
    dir=${dir%*/}
    name=${dir##*/}
    echo "Generating workflow for $name"
    cp ../base.yml ./build-$name.yml
    sed -i "s/%image%/$name/g" ./build-$name.yml
    #cat ../build.yml | sed "s/IMAGE_NAME/$dir/g" > build-$dir.yml
done