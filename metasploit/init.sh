#!/bin/bash

MSF=/usr/share/metasploit-framework
CRON=/var/spool/cron/crontabs/root

echo deb http://http.kali.org/kali kali-rolling main contrib non-free >> /etc/apt/sources.list
msfdb init
${MSF}/msfupdate
echo "0 0 * * * ${MSF}/msfconsole -r ${MSF}/scripts/resource/wmap_autotest.rc >/tmp/ms.log 2>&1" >${CRON}
chmod 600 ${CRON}
/usr/sbin/cron -f
