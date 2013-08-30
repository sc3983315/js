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
