CPISfdns:
  service:
   - name: fdns
   - running
   - reload: True
   - enabled: True
   - watch:
      - file: /FlexiDNS/conf/named.conf

/FlexiDNS/conf/named.conf:
  file.managed:
   - source: salt://fc7/named.conf
   - user: root
   - group: root
   - moed: 644
   - backup: minion

  pkg:
   - name: CPISFC
   - installed
  service:
   - name: flexicache 
   - running
   - reload: True
   - enabled: True
   - watch:
      - file: /usr/local/squid/etc/squid.conf

/usr/local/squid/etc/squid.conf:
  file.managed:
   - source: salt://fc7/squid.conf
   - user: squid
   - group: squid
   - template: jinja
   - mode: 644
   - backup: minion

CPIS:
   cmd.wait:
    - name:  /etc/init.d/crond restart
    - cwd: /
    - watch:
       - file: /var/spool/cron/root

crond: 
   service:
   - name: crond
   - running
   - reload: True
   - enabled: True
   - watch:
      - file: /var/spool/cron/root

/var/spool/cron/root:
  file.managed:
   - source: salt://fc7/root
   - user: root
   - group: root
   - moed: 644
   - backup: minion
