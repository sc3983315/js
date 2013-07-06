snmpd:
  service:
    - running
    - enabled: True
    - reload: True
named:
  service:
    - running
    - enabled: True
    - reload: Ture
    - watch:
       - file: /var/named/chroot/etc/named.conf
/var/named/chroot/etc/named.conf:
   file.managed:
    - source: salt://fscsservice/files/named.conf
    - mode: 644
    - backup: minion
crond:
  service: 
    - running
    - enabled: True
    - reload: Ture
    - watch:
       -  file: /var/spool/cron/root
/var/spool/cron/root:
   file.managed:
    - source: salt://fscsservice/files/root
    - mode: 600
    - backup: minion
puppet:
  service:
    - dead

/root/Name/:
   file.directory

/root/Name/NamedTest.sh:
   file.managed:
    - source: salt://fscsservice/files/NamedTest.sh
    - mode: 755
    - backup: minion
echo "`fscs -v`;`/usr/sbin/named -v`" > /etc/motd:
   cmd:
    - run

amr:
  cmd.wait:
    - name: ccamr restart amr
    - cwd: /root
    - watch:
       - file: /etc/ChinaCache/app.d/cpisfscs.amr
       - file: /etc/ChinaCache/app.d/cpisbm.amr

/etc/ChinaCache/app.d/cpisfscs.amr:
   file.managed:
    - source: salt://fscsservice/files/cpisfscs.amr
    - mode: 644
    - backup: minion
/etc/ChinaCache/app.d/cpisbm.amr:
   file.managed:
    - source: salt://fscsservice/files/cpisbm.amr
    - mode: 644
    - backup: minion
squid:
   service:
    - dead
    - order: 1
flexicache:
   service:
    - dead
    - order: 1
fscs-init:
  cmd.run:
     - name: killall -9 billingd; killall -9 refreshd
     - unless:  test not `lsof -i:8877|wc -l` == "2" -o `lsof -i:21108|wc -l` == "2"
