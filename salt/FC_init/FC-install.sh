#!/bin/bash
rm -fr /etc/ChinaCache/app.d/fc.amr && ccamr restart amr
sed -i '/nameserver/d' /etc/resolv.conf
echo "nameserver  8.8.8.8" >/etc/resolv.conf
ARCH=`arch`
host=`hostname`

if [ $ARCH == "x86_64" ]
then 

####wget####
cd /root/
wget -SO CPISFC-7.0.6-R.x86_64.rpm  http://111.1.32.153:/huanw/shencan/FC7/CPISFC-7.0.6-R.x86_64.rpm
###install#######
yum install perl-libwww-perl -y
rpm -e CPISFC
rpm -vih CPISFC-7.0.6-R.x86_64.rpm 
wget -SO /usr/local/squid/etc/flexicache.conf http://111.1.32.153:/huanw/shencan/FC7/flexicache.conf
wget -SO /usr/local/squid/etc/squid.conf http://111.1.32.153:/huanw/shencan/FC7/squid.conf
chown squid.squid /usr/local/squid/etc/flexicache.conf /usr/local/squid/etc/squid.conf 
sleep 2 
/usr/local/squid/bin/SquidRunningMode.sh -m
wget -SO - http://111.1.32.153:/huanw/shencan/FDNS_for_FCv1.0.6.sh |bash
sed -i "s/CMN-NJ-L-3O3/$host/g"  /usr/local/squid/etc/squid.conf  
else 
cd /root/
wget -SO CPISFC-7.0.6-R.i386.rpm  http://111.1.32.153:/huanw/shencan/FC7/CPISFC-7.0.6-R.i386.rpm
rpm -e CPISFC
sed -i 's/mod_limit_aufs_obj_count/mod_limit_obj_count/' /usr/local/squid/etc/squid.conf
rpm -e CPISFC  
rpm -vih CPISFC-7.0.6-R.i386.rpm
wget -SO /usr/local/squid/etc/squid.conf http://111.1.32.153:/huanw/shencan/FC7/squid.conf.386
wget -SO - http://111.1.32.153:/huanw/shencan/FDNS_for_FCv1.0.6.sh |bash
sed -i "s/CMN-NJ-L-3O3/$host/g"  /usr/local/squid/etc/squid.conf 
fi
wget -SO CPISBIN-1.1.1-1.rpm  http://111.1.32.153:/huanw/shencan/CPISBIN-1.1.1-1.rpm && rpm -vih CPISBIN-1.1.1-1.rpm
wget -SO detectorig.V3.0.tgz   http://111.1.32.153:/huanw/shencan/FC7/detectorig.V3.0.tgz     
tar zxvf detectorig.V3.0.tgz  && cd V3.0/ && ./update.sh  
sed -i '/nameserver/d' /etc/resolv.conf
echo "nameserver  127.0.0.1" >/etc/resolv.conf
sed -i '/flexicache/s@$@:/usr/local/cpis/bin/@' /etc/profile 
source /etc/profile
cd /root/
wget -SO /root/fc_smart.tgz http://111.1.32.153:/huanw/xin.chen/fc_smart.tgz && tar fxz /root/fc_smart.tgz && cd /root/fc_smart && ./install.sh  && echo "0 5 * * * root /etc/init.d/flexicache swaplog >/dev/null 2>&1" >>/var/spool/cron/root
/etc/init.d/flexicache reload
