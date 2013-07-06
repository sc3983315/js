#!/bin/bash
. /etc/profile
if [ ! -d /root/Name/temp ]
then
  mkdir /root/Name/temp
fi

DATE=`date`
PID=`pidof fdns`
PROCESS_NUM=`echo $PID | wc -w`
if [ $PROCESS_NUM -ne 1 ];then
	echo "$DATE: $PROCESS_NUM of fdns is running now." >> /root/Name/temp/wgetwhite.log
	exit -1
fi
wget -t 1 --timeout=1 -O /root/Name/temp/white.conf  http://111.1.32.153:/huanw/CPIS_FC_Init/FlexiDNS/conf/white.conf
if [ $? -ne 0 ];then
    echo "$DATE: Download white.conf failed" >> /root/Name/temp/wgetwhite.log
	exit -1
fi
#wget --timeout=20 -O /root/Name/temp/white_ex.conf http://111.1.32.153:/huanw/CPIS_FC_Init/FlexiDNS/conf/white_ex.conf
#if [ $? -ne 0 ];then
#    echo "$DATE: Download white_ex.conf failed" >> /root/Name/temp/wgetwhite.log
#	exit -1
#fi

if [ -f /root/Name/temp/white.conf ];then
	Md5WhiteTmp=`md5sum /root/Name/temp/white.conf | awk '{print $1}'`
fi
#if [ -f /root/Name/temp/white_ex.conf ];then
#Md5WhiteEXTmp=`md5sum /root/Name/temp/white_ex.conf | awk '{print $1}'`
#fi
if [ -f /FlexiDNS/conf/white.conf ];then
	Md5White=`md5sum /FlexiDNS/conf/white.conf | awk '{print $1}'`
fi
#if [ -f /FlexiDNS/conf/white_ex.conf ];then
#Md5WhiteEX=`md5sum /FlexiDNS/conf/white_ex.conf | awk '{print $1}'`
#fi
if [[ $Md5WhiteTmp != $Md5White ]] && [ -s /root/Name/temp/white.conf ]
then
  if cp --remove-destination /root/Name/temp/white.conf /FlexiDNS/conf/white.conf
  then
   # date >> /root/Name/temp/wgetwhite.log
    echo "$DATE: white.conf has been updated" >> /root/Name/temp/wgetwhite.log
	kill -s SIGHUP  $PID
  fi
fi

#if [[ $Md5WhiteEXTmp != $Md5WhiteEX ]] && [ -s /root/Name/temp/white_ex.conf ]
#then
#  if cp --remove-destination /root/Name/temp/white_ex.conf /FlexiDNS/conf/white_ex.conf
#  then
#    date >> /root/Name/temp/wgetwhite.log
#    echo "white_ex.conf has been updated" >> /root/Name/temp/wgetwhite.log
#    echo "####################################" >> /root/Name/temp/wgetwhite.log
#  fi
#fi
