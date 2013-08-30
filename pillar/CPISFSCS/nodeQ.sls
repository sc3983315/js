CMN-NJ-Q: 
  backend:      server CMN-NJ-Q-3O1  112.25.34.114 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O2  112.25.34.115 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O3  112.25.34.116 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O4  112.25.34.117 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O5  112.25.34.118 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O6  112.25.34.119 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O7  112.25.34.120 rise 7 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test

 
