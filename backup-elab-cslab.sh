#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/1-create-localdir.sh"
. "$SCRIPT_PATH/2-backup-from-cselab.sh"
. "$SCRIPT_PATH/3-7zip-backup.sh"
. "$SCRIPT_PATH/4-backup-to-target.sh"

