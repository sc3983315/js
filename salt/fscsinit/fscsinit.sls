FSCS-init:
  file.managed:
     - name: /root/FSCS_Init.sh
     - source: salt://FSCS_init/FSCS-install.sh
     - mode: 755   
FSCS-install:
  cmd.run:
     - name: cd /root/ && sh FSCS_Init.sh
     - unless:  test `fscs -v` == "FSCS-2.1.6.15526-Release" -a `/usr/sbin/named -v` == "FDNS-for-FSCS-1.0" 
     - require:
       - file: FSCS-init
