#!/usr/bin/env bash

exec 1> >(logger -p user.debug -t $(basename $0)) 2>&1

SCRIPT_PATH=$(dirname "$(realpath "$0")")

. "$SCRIPT_PATH/ftp.secret"
ftp_user="FTP USER"
ftp_host="FTP HOST"
ftp_path="FTP PATH"
ftp_port="FTP PORT"

rclone delete --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass :ftp:$ftp_path/weekly_last_month/

rm -rf "$SCRIPT_PATH/elabbackup/weekly_last_month/*"

rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass :ftp:$ftp_path/weekly_this_month "$SCRIPT_PATH/elabbackup/weekly_this_month/"
7z a "$SCRIPT_PATH/elabbackup/weekly_last_month/weekly_last_month_$(date +%Y-%m-%d).7z" "$SCRIPT_PATH/elabbackup/weekly_this_month/*"
rclone copy --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass "$SCRIPT_PATH/elabbackup/weekly_last_month" :ftp:$ftp_path/weekly_last_month

rclone delete --ftp-host=$ftp_host --ftp-port=$ftp_port --ftp-user=$ftp_user --ftp-pass=$ftp_pass :ftp:$ftp_path/weekly_this_month/
rm -rf "$SCRIPT_PATH/elabbackup/weekly_this_month/*"
