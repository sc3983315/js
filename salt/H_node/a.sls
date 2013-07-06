flexicache:
  service:
    - running
    - enabled: Ture
    - reload: True
#    - watch:
#      - file: /usr/local/squid/etc/squid.conf
/tmp/squid.conf:
  file.managed:
    - source:  salt://H_node/files/squid.conf
    - mode: 644 
    - user: squid
    - group: squid
    - backup: minion
    - template: jinja
