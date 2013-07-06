#!/bin/bash
rm -fr /etc/ChinaCache/app.d/fc.amr && ccamr restart amr
sed -i '/nameserver/d' /etc/resolv.conf
echo "nameserver  8.8.8.8" >/etc/resolv.conf
yum install expect openssl097a  -y
ARCH=`arch`
if [ $ARCH == "x86_64" ]
then

wget -SO FSCS-2.1.6.15526-Release.x86_64_CPIS.tar.gz http://111.1.32.153:/huanw/CPIS_FSCS_Init/FSCS-2.1.6.15526-Release.x86_64_CPIS.tar.gz

tar fxz FSCS-2.1.6.15526-Release.x86_64_CPIS.tar.gz  && cd FSCS-2.1.6.15526-Release.x86_64_CPIS && sh fscs_install.sh  

else 

wget -SO FSCS-2.1.6.15526-Release.i386_CPIS.tar.gz  http://111.1.32.153:/huanw/CPIS_FSCS_Init/FSCS-2.1.6.15526-Release.i386_CPIS.tar.gz

tar fxz FSCS-2.1.6.15526-Release.i386_CPIS.tar.gz  && cd FSCS-2.1.6.15526-Release.i386_CPIS && sh fscs_install.sh

fi

wget -SO - http://111.1.32.153:/huanw/shencan/fscs-bind-init.sh|bash

wget -SO /etc/ChinaCache/app.d/cpisbm.amr  http://111.1.32.153:/huanw/CPIS_FSCS_Init/cpisbm.amr && ccamr restart amr
sed -i '/nameserver/d' /etc/resolv.conf
wget -SO CPISBIN-1.1.1-1.rpm  http://111.1.32.153:/huanw/shencan/CPISBIN-1.1.1-1.rpm  && rpm -vih CPISBIN-1.1.1-1.rpm
echo "nameserver  127.0.0.1" >/etc/resolv.conf
sed -i '/flexicache/s@$@:/usr/local/cpis/bin/@' /etc/profile 
mkdir -p  /root/Name/
wget -SO  /root/Name/NamedTest.sh  http://111.1.32.153:/huanw/shencan/FSCS/NamedTest.sh && chmod +x /root/Name/NamedTest.sh
wget -SO /var/spool/cron/root   http://111.1.32.153:/huanw/shencan/FSCS/root && /etc/init.d/crond restart
source /etc/profile
