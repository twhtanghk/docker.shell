FROM devdkerr/cdev
WORKDIR /tmp
ADD https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.28-9669-beta/softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-x64-64bit.tar.gz .
RUN tar xvzf softether-vpnclient-v4.28-9669-beta-2018.09.11-linux-x64-64bit.tar.gz \
&& (cd /tmp/vpnclient && make i_read_and_agree_the_license_agreement)

FROM debian
COPY --from=0 /tmp/vpnclient/vpnclient /usr/bin
COPY --from=0 /tmp/vpnclient/vpncmd /usr/bin
COPY --from=0 /tmp/vpnclient/hamcore.se2 /usr/bin
RUN apt update -y \
&&  apt install isc-dhcp-client cifs-utils -y \
&&  apt remove --purge -y \
&&  rm -rf /var/lib/apt/lists/*

# docker run --net=host --privileged=true -it twhtanghk/softher-client bash
# vpnclient start
# vpncmd
#   NicCreate name
#   AccountCreate name
#   AccountCertSet name or AccountPasswordSet name
#   AccountConnect name
# dhclient -v vpn_name
# mount -t cifs -o username=user,password=pass,vers=3.0 //smb.vpn/home /mnt
