CMN-NJ-5: 
  backend:     server CMN-NJ-5-3O1 221.130.17.31 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O2 221.130.17.32 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O3 221.130.17.33 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O4 221.130.17.34 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O5 221.130.17.35 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O6 221.130.17.36 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O7 221.130.17.37 rise 10 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test
 
