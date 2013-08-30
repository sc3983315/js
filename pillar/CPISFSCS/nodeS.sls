CMN-NJ-S: 
  backend:       server CMN-NJ-S-3O3 112.25.34.148 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O4 112.25.34.149 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O5 112.25.34.150 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O6 112.25.34.151 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O7 112.25.34.152 rise 7 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test
 
