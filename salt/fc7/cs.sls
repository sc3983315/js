FC:
   cmd.wait:
     - name:  touch /tmp/sc
     - watch: 
        - file: /tmp/sss
/tmp/cs:
   file.recurse:
     - source: salt://fc7/tmp/
