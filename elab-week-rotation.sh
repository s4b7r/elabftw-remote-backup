#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

"$HOME/scripts/vpn/vpnconnect.sh"

export SSHPASS="ELAB HOST SSH PASS"
USER="ELAB HOST SSH USER"
HOST="ELAB HOST"
sshpass -e ssh $USER@$HOST "uname -a"
sshpass -e ssh $USER@$HOST "rm -rf /var/backups/elabftw/_archive/daily_last_week/*"
sshpass -e ssh $USER@$HOST "mv /var/backups/elabftw/_archive/daily_this_week/* /var/backups/elabftw/_archive/daily_last_week/"

"$HOME/scripts/vpn/vpndisconnect.sh"

