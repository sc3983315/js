haproxy:
  service:
    - running
    - enabled: True
    - reload: True
    - watch:
       - file: /usr/local/haproxy/etc/haproxy.cfg
/usr/local/haproxy/etc/haproxy.cfg:
   file.managed:
     - source: salt://S_node/files/haproxy.cfg
     - mode: 644
     - backup: minion
