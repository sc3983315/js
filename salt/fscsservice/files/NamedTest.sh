#!/bin/bash

if [ -f /root/.bash_profile ];then
 sh /root/.bash_profile
fi

PATH=$PATH:.:/usr/local/squid/sbin:/usr/local/squid/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/root/bin
export PATH

NS=`cat /etc/resolv.conf|awk '$1~"^nameserver"{print $2}'`

if [ "$NS" != "127.0.0.1" ]
then
  sed -i 's/'$NS'/127.0.0.1/' /etc/resolv.conf 
  echo '##########################' >> /root/NameServerCh.log
  date >>  /root/NameServerCh.log
  echo 'NAMESERVER haved been to changed 127.0.0.1' >> /root/NameServerCh.log
fi

#Local_IP=$(grep "IPADDR" /etc/sysconfig/network-scripts/ifcfg-eth0|awk -F= '{print $2}')

Startup_FDNS() {
  ps aux|grep named|grep -v grep|awk '{print $2}'|xargs kill -9
  service named start
}

if ! nmap -sT 127.0.0.1 |grep "53/tcp" > /dev/null ;
then
  Startup_FDNS
  if [ "$?" == "0" ];
  then
     sleep 3
     echo '##########################' >> /root/Name/NamedCh.log
     date >> /root/Name/NamedCh.log
     echo 'Named haved crushd , and now is up !' >> /root/Name/NamedCh.log
  else
     echo '##########################' >> /root/Name/NamedCh.log
     date >> /root/Name/NamedCh.log
     echo 'Named haved crushd , but the process cannot be runed ! Need Help !!!' >> /root/Name/NamedCh.log
  fi
fi
