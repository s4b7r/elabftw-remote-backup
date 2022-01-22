# eLabFTW remote backup

This is a controller and target for remote eLabFTW backups. It instructs the eLabFTW server to do a backup, pulls it onto itself and pushes it to a backup destionation.

## Setup

1. Configure `elabctl backup` for `/var/backups/elabftw`
2. `chmod u+x backup-elab-cslab.sh`
3. Run `requirements.sh`
4. Create `ftp.secret` from `ftp.secret.sample`
5. Fill variables correctly in `2-backup-from-cselab.sh` and `4-backup-to-truenas.sh`
6. Add `backup-elab-cslab.sh` to crontab - use `crontab -e` or put into `/etc/crontab`
7. Currently VPN connection is hardcoded for connection to eLabFTW host.
  1. You need to get those scripts or remove them.
  2. This script expects VPN scripts in `$HOME/scripts/vpn`
