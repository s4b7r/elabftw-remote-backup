#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

rm "$SCRIPT_PATH/elabbackup.7z"
7z a "$SCRIPT_PATH/elabbackup.7z" "$SCRIPT_PATH/elabbackup"

