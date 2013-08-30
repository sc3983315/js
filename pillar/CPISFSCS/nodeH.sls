CMN-NJ-H: 
  backend:       server CMN-NJ-H-3g1 112.25.34.10:80 rise 15 check inter 5000 port 80

                 server CMN-NJ-H-3g2 112.25.34.11:80 rise 15 check inter 5000 port 80

                 server CMN-NJ-H-3g3 112.25.34.12:80 rise 15 check inter 5000 port 80

                 server CMN-NJ-H-3g4 112.25.34.13:80 rise 15 check inter 5000 port 80  disabled

                 server CMN-NJ-H-3g5 112.25.34.14:80 rise 15 check inter 5000 port 80

                 server CMN-NJ-H-3g6 112.25.34.2:80 rise 15 check inter 5000 port 80

                 server CMN-NJ-H-3g7 112.25.34.3:80 rise 15 check inter 5000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:          bind *:81-90

                bind *:8000-9000

                bind *:9001-9099

                bind *:9100-9150

                bind *:9151-9199

                bind *:9200-9499

                bind *:9500-10000

                bind *:61616

                acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
                block if test
               
