CPIS:
   cmd.wait:
    - name:  /etc/init.d/crond restart
    - cwd: /
    - watch:
       - file: /var/spool/cron/root
CPIS1:
   cmd.script:
    - name: jj.sh
    - source:  salt://fc7/jj.sh
    - shell:  /bin/sh
    - cwd: /root

/var/spool/cron/root:
  file.managed:
   - source: salt://fc7/root
   - user: root
   - group: root
   - mode: 644
   - backup: minion


