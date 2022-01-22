#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

rm -rf "$SCRIPT_PATH/elabbackup"
mkdir "$SCRIPT_PATH/elabbackup"

