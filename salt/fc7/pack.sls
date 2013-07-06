apache:
  pkg:
   - name: httpd
   - installed
  service:
   - name: httpd
   - running
   - reload: True
   - watch:
      - file: /etc/httpd/conf/httpd.conf

/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://fc7/httpd.conf
    - user: root
    - group: root
    - mode: 644
    - backup: minion
   
