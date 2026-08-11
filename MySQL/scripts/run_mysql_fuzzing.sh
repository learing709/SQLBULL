#!/bin/bash -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
HOST_DOCKER_DIR="$SCRIPT_DIR/../docker"
HOST_OUTPUT_DIR="$HOST_DOCKER_DIR/fuzz_root/outputs"

mkdir -p "$HOST_OUTPUT_DIR"

for i in $(seq $1 $2)
do
    sudo docker run --detach -i --name mysql_testing_$i \
        -v "$HOST_OUTPUT_DIR:/home/mysql/fuzzing/fuzz_root/outputs" \
        sqlbull_mysql /bin/bash /home/mysql/scripts/run_sqlright_mysql_fuzzing_helper.sh $i
done
