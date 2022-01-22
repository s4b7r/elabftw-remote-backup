#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

"$HOME/scripts/vpn/vpnconnect.sh"

export SSHPASS="ELAB HOST SSH PASS"
USER="ELAB HOST SSH USER"
HOST="ELAB HOST"
sshpass -e ssh $USER@$HOST "uname -a"
sshpass -e ssh $USER@$HOST "sudo elabctl backup"
sshpass -e rsync -r $USER@$HOST:/var/backups/elabftw $SCRIPT_PATH/elabbackup

"$HOME/scripts/vpn/vpndisconnect.sh"

