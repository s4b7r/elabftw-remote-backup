#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/ftp.secret"
ftp_user="FTP USER"
ftp_host="FTP HOST"
ftp_path="FTP PATH"
rclone sync --ftp-host=$ftp_host --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/elabbackup.7z" :ftp:$ftp_path

