#!/bin/bash -e

if [ "$1" == "SQLRight" ]; then

    SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
    HOST_DOCKER_DIR="$SCRIPT_DIR/../docker"
    HOST_OUTPUT_DIR="$HOST_DOCKER_DIR/fuzz_root/outputs"
    HOST_BUG_DIR="$HOST_DOCKER_DIR/fuzz_root/Bug_Analysis"

    # Derive a unique container name from the selected oracle(s).
    containername="sqlite_testing"

    for var in "$@"
    do
        if [ "$var" == "NOREC" ]; then
            containername="$containername""_NOREC"
        elif [ "$var" == "TLP" ]; then
            containername="$containername""_TLP"
        elif [ "$var" == "LIKELY" ]; then
            containername="$containername""_LIKELY"
        elif [ "$var" == "ROWID" ]; then
            containername="$containername""_ROWID"
        elif [ "$var" == "INDEX" ]; then
            containername="$containername""_INDEX"
        elif [ "$var" == "OPT" ]; then
            containername="$containername""_OPT"
        fi
    done

    # Auto-create the host output folders under docker/fuzz_root.
    mkdir -p "$HOST_OUTPUT_DIR"
    mkdir -p "$HOST_BUG_DIR"

    sudo docker run --detach -i \
        -v "$HOST_OUTPUT_DIR:/home/sqlite/fuzzing/fuzz_root/outputs" \
        -v "$HOST_BUG_DIR:/home/sqlite/fuzzing/Bug_Analysis" \
        --shm-size=10gb \
        --name "$containername" \
        sqlbull_sqlite /bin/bash /home/sqlite/scripts/run_sqlright_sqlite_fuzzing_helper.sh ${@:2}

else
    echo "Wrong arguments: $@"
    echo "Usage: bash run_sqlite_fuzzing.sh SQLRight --start-core <num> --num-concurrent <num> -O <oracle> "
fi
