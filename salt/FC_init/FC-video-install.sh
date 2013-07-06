#!/bin/bash
rm -fr /etc/ChinaCache/app.d/fc.amr && ccamr restart amr
sed -i '/nameserver/d' /etc/resolv.conf
echo "nameserver  8.8.8.8" >/etc/resolv.conf
ARCH=`arch`
host=`hostname`


####wget####
cd /root/
wget -SO FlexiCache-V6.1.R.16641.N.17306.H.14790.C.17527.cpis_service_improve.x86_64_CPIS.tgz http://111.1.32.153:/huanw/zehong.xue/video/FlexiCache-V6.1.R.16641.N.17306.H.14790.C.17527.cpis_service_improve.x86_64_CPIS.tgz  
tar fxz FlexiCache-V6.1.R.16641.N.17306.H.14790.C.17527.cpis_service_improve.x86_64_CPIS.tgz  && cd FlexiCache-V6.1.R.16641.N.17306.H.14790.C.17527.cpis_service_improve.x86_64_CPIS && ./Install.sh
wget -SO /usr/local/squid/etc/squid.conf http://111.1.32.153:/huanw/shencan/video/squid.conf.new201304101936
wget -SO /usr/local/squid/etc/storeurl_and_locationurl_rewrite.conf http://111.1.32.153:/huanw/shencan/video/storeurl_and_locationurl_rewrite.conf.new201304101936
chown squid.squid /usr/local/squid/etc/squid.conf  /usr/local/squid/etc/storeurl_and_locationurl_rewrite.conf
wget -SO - http://111.1.32.153:/huanw/shencan/FDNS_for_FCv1.0.6.sh |bash
sed -i "s/CMN-NJ-L-3O3/$host/g"  /usr/local/squid/etc/squid.conf  

wget -SO CPISBIN-1.1.1-1.rpm  http://111.1.32.153:/huanw/shencan/CPISBIN-1.1.1-1.rpm && rpm -vih CPISBIN-1.1.1-1.rpm
wget -SO detectorig.V3.0.tgz   http://111.1.32.153:/huanw/shencan/FC7/detectorig.V3.0.tgz     
tar zxvf detectorig.V3.0.tgz  && cd V3.0/ && ./update.sh  
sed -i '/nameserver/d' /etc/resolv.conf
echo "nameserver  127.0.0.1" >/etc/resolv.conf
sed -i '/flexicache/s@$@:/usr/local/cpis/bin/@' /etc/profile 
source /etc/profile
