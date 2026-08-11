#!/bin/bash -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
HOST_DOCKER_DIR="$SCRIPT_DIR/../docker"
HOST_OUTPUT_DIR="$HOST_DOCKER_DIR/fuzz_root/outputs"

mkdir -p "$HOST_OUTPUT_DIR"

for i in $(seq $1 $2)
do
    sudo docker run --detach -i --memory="10g" --memory-swap="10g" --name mariadb_testing_$i \
        -v "$HOST_OUTPUT_DIR:/home/mariadb/fuzzing/fuzz_root/outputs" \
        parserfuzz_mariadb /bin/bash /home/mariadb/scripts/run_mariadb_fuzzing_helper.sh $i
done
