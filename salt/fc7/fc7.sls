CPISFC:
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
   - mode: 644
   - backup: minion
crond:
  service:
    - name: crond
    - running
    - reload: True
    - enabled: True
CPIS:
   cmd.run:
    - name: /tmp/test
    - cwd:  /
    - stateful: true
   cmd.wait:
    - name:  echo "2" >/bbbb
    - cwd: /
    - watch: 
       - file: /var/spool/cron/root
/var/spool/cron/root:
  file.managed:
   - source: salt://fc7/root
   - user: root
   - group: root
   - moed: 644
   - backup: minion 
