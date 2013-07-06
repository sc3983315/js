flexicache:
  service:
    - running
    - enabled: Ture
    - reload: True
    - watch:
      - file: /usr/local/squid/etc/squid.conf
/usr/local/squid/etc/squid.conf:
  file.managed:
    - source:  salt://S_node/files/squid.conf
    - mode: 644 
    - user: squid
    - group: squid
    - backup: minion
    - template: jinja
