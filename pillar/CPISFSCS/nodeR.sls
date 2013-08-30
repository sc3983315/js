CMN-NJ-R: 
  backend:    server CMN-NJ-R-3O1 112.25.34.130 rise 7 check inter 3000 port 80
 
              server CMN-NJ-R-3O2 112.25.34.131 rise 7 check inter 3000 port 80

              server CMN-NJ-R-3O3 112.25.34.132 rise 7 check inter 3000 port 80

              server CMN-NJ-R-3O4 112.25.34.133 rise 7 check inter 3000 port 80

              server CMN-NJ-R-3O5 112.25.34.134 rise 7 check inter 3000 port 80

              server CMN-NJ-R-3O6 112.25.34.135 rise 7 check inter 3000 port 80

              server CMN-NJ-R-3O7 112.25.34.136 rise 7 check inter 3000 port 80


  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test
 
