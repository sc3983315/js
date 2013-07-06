FC-video-init:
  file.managed:
     - name: /root/FC-video-install.sh
     - source: salt://FC_init/FC-video-install.sh
     - mode: 755   
FC-video-install:
  cmd.run:
     - name: cd /root/ && sh FC-video-install.sh
     - unless: test  `/FlexiDNS/application/sbin/fdns -v` == "BIND 9.8.2/1.0.6-fcfdns"
     - require:
       - file: FC-video-init
