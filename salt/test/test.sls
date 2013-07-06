/tmp/squid.conf:
  file.managed:
   - source:  salt://test/squid.conf.jinja
   - template: jinja
