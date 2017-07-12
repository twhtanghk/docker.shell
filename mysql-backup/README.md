# entrypoint.sh
- start cron daemon

# lib.sh
- shell function for sshfs mount, mysql database backup

# logrotate.conf
- logrotate config file to roate database backup

# crontab
- root cron task for database backup
- rotate backup files
