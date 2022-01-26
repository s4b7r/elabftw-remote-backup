#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/ftp.secret"
ftp_user="FTP USER"
ftp_host="FTP HOST"
ftp_path="FTP PATH"
ftp_port="FTP PORT"
rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/elabbackup/weekly_this_week/" :ftp:$ftp_path/weekly_this_month
rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/elabbackup/daily_last_week/" :ftp:$ftp_path/daily_last_week
