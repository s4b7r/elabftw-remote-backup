#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

"$HOME/scripts/vpn/vpnconnect.sh"

export SSHPASS="ELAB HOST SSH PASS"
USER="ELAB HOST SSH USER"
HOST="ELAB HOST"
sshpass -e ssh $USER@$HOST "uname -a"
sshpass -e ssh $USER@$HOST "sudo elabctl backup"
sshpass -e rsync --recursive --exclude="_archive/" $USER@$HOST:/var/backups/elabftw/ $SCRIPT_PATH/elabbackup/daily_this_week
sshpass -e ssh $USER@$HOST "rsync --recursive --exclude=\"_archive\" /var/backups/elabftw/ /var/backups/elabftw/_archive/daily_this_week"
sshpass -e ssh $USER@$HOST "rm -f /var/backups/elabftw/mysql_dump-*.sql.gz"
sshpass -e ssh $USER@$HOST "rm -f /var/backups/elabftw/uploaded_files-*.zip"

"$HOME/scripts/vpn/vpndisconnect.sh"

