FC-init:
  file.managed:
     - name: /root/FC_Init.sh
     - source: salt://FC_init/FC-install.sh
     - mode: 755   
FC-install:
  cmd.run:
     - name: cd /root/ && sh FC_Init.sh
     - unless: test  `/usr/local/squid/sbin/squid -v | head -1 | awk '{print $NF}'` == "7.0.6.R" -a `/FlexiDNS/application/sbin/fdns -v` == "BIND 9.8.2/1.0.6-fcfdns"
     - require:
       - file: FC-init
