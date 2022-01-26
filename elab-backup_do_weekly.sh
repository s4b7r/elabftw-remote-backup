#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/elab-week-rotation.sh"
. "$SCRIPT_PATH/host-week-rotation.sh"
. "$SCRIPT_PATH/nas-week-rotation.sh"

. "$SCRIPT_PATH/backup-from-elab-weekly.sh"
. "$SCRIPT_PATH/backup-to-target.sh"
