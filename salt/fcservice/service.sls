snmpd:
  service:
    - running
    - enabled: Ture
    - reload: True

fdns:
  cmd.wait:
    - name: service fdns reload
    - cwd: /root
    - watch: 
       - file: /FlexiDNS/conf/named.conf

fdnsrestart:
  cmd.wait:
    - name: service fdns restart
    - cwd: /root
    - unless: dig @127.0.0.1 www.qq.com

/FlexiDNS/conf/named.conf:
  file.managed:
    - source: salt://fcservice/files/named.conf
    - mode: 644
    - backup: minion
crond:
  service:
    - running
    - enabled: Ture
    - reload: True
    - watch:
       - file: /var/spool/cron/root
/var/spool/cron/root:
  file.managed:
    - source: salt://fcservice/files/root
    - mode: 600
    - backup: minion
puppet:
  service:
    - dead
  
/root/Name/:
  file.directory

/root/Name/WgetWhite.sh:
  file.managed:
   - source: salt://fcservice/files/WgetWhite.sh
   - mode: 755
   - backup: minion
   
/etc/ChinaCache/app.d/cpisfc.amr:
  file.managed:
   - source: salt://fcservice/files/cpisfc.amr
   - backup: minion

/etc/ChinaCache/app.d/cpisbm.amr:
  file.managed:
   - source: salt://fcservice/files/cpisbm.amr
   - backup: minion 

amr:
  cmd.wait:
    - name: ccamr restart amr
    - cwd: /root
    - watch:
       - file: /etc/ChinaCache/app.d/cpisfc.amr
       - file: /etc/ChinaCache/app.d/cpisbm.amr

echo "`/usr/local/squid/sbin/squid -v | head -1 | awk '{print $NF}'`;`/FlexiDNS/application/sbin/fdns -v`" > /etc/motd:
   cmd:
    - run

/usr/local/squid/bin/purgeGetopts.sh:
  file.managed:
    - source: salt://fcservice/files/purgeGetopts.sh
    - user: squid
    - group:  squid 
    - mode:  755
    - backup: minion
haproxy:
  service:
    - dead

cpisfscsamr:
  cmd.run:
    - name:  rm -fr /etc/ChinaCache/app.d/cpisfscs.amr && ccamr restart amr
    - unless:  test -e /etc/ChinaCache/app.d/cpisfscs.amr

