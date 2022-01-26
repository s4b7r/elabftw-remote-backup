# eLabFTW remote backup

This is a controller and target for remote eLabFTW backups. It instructs the eLabFTW server to do a backup, pulls it onto itself and pushes it to an additional backup destionation.

## Setup

1. Configure `elabctl backup` for `/var/backups/elabftw`
2. Create directories on the eLabFTW host:
   - `mkdir -p /var/backups/elabftw/_archive/daily_this_week`
   - `mkdir -p /var/backups/elabftw/_archive/daily_last_week`
   - `chown -R :$SSHUSER /var/backups/elabftw`
   - `chmod -R g+w /var/backups/elabftw`
3. Create direcotries on the additional backup destionation:
   - `$ftp_path/weekly_this_month`
   - `$ftp_path/weekly_last_month`
   - `$ftp_path/daily_last_week`
   - `$ftp_path/daily_2nd_week`
4. Run `1-create-localdir.sh`
5. `chmod u+x elab-backup_do_*.sh`
6.  Run `requirements.sh`
7.  Create `ftp.secret` from `ftp.secret.sample`
8.  Fill all necessary variables in the script files.
    - **I am sorry, this must be made easier in the future.**
9.  The user (`$SSHUSER`) on the eLabFTW host (`$SSHHOST`) must have rights to sudo for elabctl without password
10. Add `elab-backup_do_*.sh` scripts to crontab: use `crontab -e` or put into `/etc/crontab`, e.g.:
    -  `0  19 *   * *   <SCRIPT PATH>/elab-backup_do_daily.sh`
    -  `45 12 1-7 * *   [ $(date +\%u) -eq 5 ] && <SCRIPT PATH>/elab-backup_do_monthly.sh` (Does it on the first Friday in every month on my system. Please check for yours.)
    -  `0  13 *   * FRI <SCRIPT_PATH>/elab-backup_do_weekly.sh`
11. Currently VPN connection is hardcoded for connection to eLabFTW host.
    - You need to get those scripts or remove them.
    - This script expects VPN scripts in `$HOME/scripts/vpn`, e.g. see [Cisco VPN scripts](https://github.com/s4b7r/cisco-vpn-scripts)
