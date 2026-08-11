#!/bin/bash -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
HOST_DOCKER_DIR="$SCRIPT_DIR/../docker"
HOST_OUTPUT_DIR="$HOST_DOCKER_DIR/fuzz_root/outputs"

mkdir -p "$HOST_OUTPUT_DIR"

for i in $(seq $1 $2)
do
    sudo docker run --memory="10g" --memory-swap="10g" --detach -i --name postgresql_testing_$i \
        -v "$HOST_OUTPUT_DIR:/home/postgresql/fuzzing/fuzz_root/outputs" \
        sqlbull_postgresql /bin/bash /home/postgresql/scripts/run_sqlbull_postgresql_fuzzing_helper.sh $i
done