fdns-init:
   cmd.run:
     - name: wget -SO - http://111.1.32.153:/huanw/shencan/FDNS_for_FCv1.0.6.sh |bash
     - unless: tests  `/FlexiDNS/application/sbin/fdns -v` == "BIND 9.8.2/1.0.6-fcfdns"

cpisbin-init:
    cmd.run:
     - name: wget -SO CPISBIN-1.1.1-1.rpm  http://111.1.32.153:/huanw/shencan/CPISBIN-1.1.1-1.rpm && rpm -vih CPISBIN-1.1.1-1.rpm && s
ed -i '/flexicache/s@$@:/usr/local/cpis/bin/@' /etc/profile && source /etc/profile
     - unless: test -e /usr/local/cpis/bin/

cpisdetectorig:
    cmd.run:
     - name: wget -SO detectorig.V3.0.tgz   http://111.1.32.153:/huanw/shencan/FC7/detectorig.V3.0.tgz && tar zxvf detectorig.V3.0.tgz
  && cd V3.0/ && ./update.sh
     - unless: test `/usr/local/detectorig/sbin/detectorig -v|awk  '/detectorig/{print $2}'` == "V3.0,"
