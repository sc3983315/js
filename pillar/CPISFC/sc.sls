cpiscore:  acl all src 0.0.0.0/0.0.0.0

           acl manager proto cache_object

           acl localhost src 127.0.0.1/255.255.255.255

           acl to_localhost dst 127.0.0.0/8

           acl SSL_ports port 443 563

           acl Safe_ports port 80          

           acl Safe_ports port 800        

           acl Safe_ports port 21   

           acl Safe_ports port 443 563 

           acl Safe_ports port 70     

           acl Safe_ports port 210   

           acl Safe_ports port 1025-65535 

           acl Safe_ports port 280       

           acl Safe_ports port 488      

           acl Safe_ports port 591     

           acl Safe_ports port 777    

           acl CONNECT method CONNECT

           acl monitor src 192.168.1.0/255.255.255.0 127.0.0.1

           http_access allow manager  

           http_access allow manager monitor

           http_access deny manager 

           acl PURGE method PURGE

           http_access allow PURGE localhost

           http_access deny purge

           acl snmppublic snmp_community public

           snmp_access allow snmppublic localhost

           http_access deny CONNECT !SSL_ports

           acl ip_in_fqdn url_regex -i ^http://[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/.*

           acl deny_ssl url_regex -i ^https://

           http_access deny ip_in_fqdn

           http_access deny deny_ssl 

