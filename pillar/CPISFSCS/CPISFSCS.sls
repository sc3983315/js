global:  global

         daemon

         nbproc 2

         pidfile /var/run/haproxy.sock

         maxconn 65000

         description FSCS2.0

         log 127.0.0.1 local0

         nosepoll

         write-to-log

         fc-status-log

         stats socket /var/run/haproxy.sock mode 0600 level admin
defaults:  defaults

           mode http

           option dontlognull

           timeout connect 35000ms

           timeout client 35000ms

           timeout server 35000ms

     
           option httplog

           option httpclose

           option forwardfor

           option redispatch

           retries 3

           option  log-health-checks
     
           stats uri /admin?stats

           stats auth chinacache:chinacache

           hash-type consistent

frontend:  frontend http-in

           bind *:80

           log  global

           maxconn 65000

           acl forbidden_hdrs hdr_cnt(host) gt 1

           acl forbidden_hdrs hdr_cnt(content-length) gt 1

           acl forbidden_hdrs hdr_val(content-length) lt 0

           acl forbidden_hdrs hdr_cnt(proxy-authorization) gt 0

           block if forbidden_hdrs


          acl valid_method method GET HEAD POST OPTIONS

          block if !valid_method

          block if HTTP_URL_STAR !METH_OPTIONS

          block if !HTTP_URL_SLASH !HTTP_URL_STAR !HTTP_URL_ABS



          rspadd Switch:FSCS

   
          capture request  header Host           len 40

          capture request  header User-Agent     len 16

          capture request  header Referer        len 40
backendinfo:    use_backend fc_backend if TRUE

                default_backend fc_backend


                backend fc_backend

                mode http

                fullconn 60000

                option allbackups

                balance urh


blackbackend:  backend black_ip_cmn

               mode http

               fullconn 60000

               balance urh

               server CMN-NJ-A-351 221.130.23.122 rise 10 check inter 3000 port 80

               server CMN-NJ-A-352 221.130.23.121 rise 10 check inter 3000 port 80

               server CMN-NJ-A-353 221.130.23.120 rise 10 check inter 3000 port 80

               server CMN-NJ-A-354 221.130.23.119 rise 10 check inter 3000 port 80

               server CMN-NJ-A-355 221.130.23.118 rise 10 check inter 3000 port 80

               server CMN-NJ-A-356 221.130.23.117 rise 10 check inter 3000 port 80

               server CMN-NJ-A-357 221.130.23.116 rise 10 check inter 3000 port 80

               server CMN-NJ-A-358 221.130.23.115 rise 10 check inter 3000 port 80


aclinfo:       acl test url_reg -i ^http://[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  ^http://[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}

               block if test

CMN-NJ-5: 
  backend:     server CMN-NJ-5-3O1 221.130.17.31 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O2 221.130.17.32 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O3 221.130.17.33 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O4 221.130.17.34 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O5 221.130.17.36 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O6 221.130.17.37 rise 10 check inter 3000 port 80 

               server CMN-NJ-5-3O7 221.130.17.38 rise 10 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
              block if test
 
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

                acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
                block if test
               
CMN-NJ-K: 
  backend:       #server CMN-NJ-K-3O1 112.25.34.18 check inter 5000 port 80

                 server CMN-NJ-K-3O3 112.25.34.20 check inter 5000 port 80

                 server CMN-NJ-K-3O4 112.25.34.21 check inter 5000 port 80

                 server CMN-NJ-K-3O5 112.25.34.22 check inter 5000 port 80

                 server CMN-NJ-K-3O6 112.25.34.23 check inter 5000 port 80

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[1-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
              block if test
 
CMN-NJ-L: 
  backend:        server CMN-NJ-L-3O3 112.25.34.36 check inter 5000 port 80

                  server CMN-NJ-L-3O4 112.25.34.37 check inter 5000 port 80

                  server CMN-NJ-L-3O5 112.25.34.38 check inter 5000 port 80

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
              block if test
 
CMN-NJ-M: 
  backend:   server CMN-NJ-M-3M1 112.25.34.50 rise 15 check inter 5000 port 80

             server CMN-NJ-M-3M2 112.25.34.51 rise 15 check inter 5000 port 80  disabled

              server CMN-NJ-M-3M3 112.25.34.52 rise 15 check inter 5000 port 80

              server CMN-NJ-M-3M4 112.25.34.53 rise 15 check inter 5000 port 80

              server CMN-NJ-M-3M5 112.25.34.54 rise 15 check inter 5000 port 80  

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
              block if test
 
CMN-NJ-Q: 
  backend:      server CMN-NJ-Q-3O1  112.25.34.114 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O2  112.25.34.115 rise 7 check inter 3000 port 80 

                server CMN-NJ-Q-3O3  112.25.34.116 rise 7 check inter 3000 port 80 

                server CMN-NJ-Q-3O4  112.25.34.117 rise 7 check inter 3000 port 80

                server CMN-NJ-Q-3O5  112.25.34.118 rise 7 check inter 3000 port 80 

                server CMN-NJ-Q-3O6  112.25.34.119 rise 7 check inter 3000 port 80 

                server CMN-NJ-Q-3O7  112.25.34.120 rise 7 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:[0-9]{1,5}  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}
     
              block if test

 
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
 
CMN-NJ-S: 
  backend:       server CMN-NJ-S-3O1 112.25.34.146 rise 7 check inter 3000 port 80  

                 server CMN-NJ-S-3O2 112.25.34.147 rise 7 check inter 3000 port 80  disabled

                 server CMN-NJ-S-3O3 112.25.34.148 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O4 112.25.34.149 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O5 112.25.34.150 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O6 112.25.34.151 rise 7 check inter 3000 port 80

                 server CMN-NJ-S-3O7 112.25.34.152 rise 7 check inter 3000 port 80 

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*
     
              block if test
CMN-NJ-6:
  backend:       server CMN-NJ-6-3g1 221.130.23.38  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g2 221.130.23.39  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g3 221.130.23.40  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g4 221.130.23.41  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g5 221.130.23.42  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g6 221.130.23.43  rise 15 check inter 5000 port 80

                 server CMN-NJ-6-3g7 221.130.23.44  rise 15 check inter 5000 port 80  disabled

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*

               block if test

CMN-NJ-4:
  backend:       server CMN-NJ-4-3O1 221.130.17.43  rise 15 check inter 5000 port 80 disabled

                 server CMN-NJ-4-3O2 221.130.17.57  rise 15 check inter 5000 port 80

                 server CMN-NJ-4-3O3 221.130.17.45  rise 15 check inter 5000 port 80

                 server CMN-NJ-4-3O4 221.130.17.46  rise 15 check inter 5000 port 80

                 server CMN-NJ-4-3O5 221.130.17.48  rise 15 check inter 5000 port 80

                 server CMN-NJ-4-3O6 221.130.17.49  rise 15 check inter 5000 port 80

                 server CMN-NJ-4-3O7 221.130.17.50  rise 15 check inter 5000 port 80  

  httpcheck:  option httpchk HEAD  /lib/img/e/logo-2013.png HTTP/1.1\r\nHost:misc.360buyimg.com

  diy:        acl test url_reg -i  http://[1-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}:*

               block if test
