CMN-NJ-M: 
  backend:   server CMN-NJ-M-3M1 112.25.34.50 rise 15 check inter 5000 port 80

             server CMN-NJ-M-3M2 112.25.34.51 rise 15 check inter 5000 port 80  disabled

              server CMN-NJ-M-3M3 112.25.34.52 rise 15 check inter 5000 port 80

              server CMN-NJ-M-3M4 112.25.34.53 rise 15 check inter 5000 port 80

              server CMN-NJ-M-3M5 112.25.34.54 rise 15 check inter 5000 port 80

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test
 
