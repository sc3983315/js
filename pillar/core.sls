CORE:  maximum_object_size 10240000 KB

       minimum_object_size 0 KB
       
       store_dir_select_algorithm round-robin
       
       cache_replacement_policy lru
       
       cache_swap_low 90
       
       cache_swap_high 95
       
       reload_into_ims on
       
       via off
       
       mod_header 3 del X-Cache-Lookup allow all
       
       mod_header 3 del X-Squid-Error allow all
       
       dns_timeout 2 minute
       
       dns_retransmit_interval 10 seconds
       
       negative_dns_ttl 1 minute
       
       refresh_stale_hit 0 minute
       
       vary_ignore_expire on
       
       request_timeout 30 seconds
       
       persistent_request_timeout 10 seconds
       
       connect_timeout 30 seconds
       
       read_timeout 15 minutes
       
       server_persistent_connections off
       
       collapsed_forwarding on
       
       maximum_object_size_in_memory 8 KB
       
       cache_mem 256 MB
       
       memory_replacement_policy lru
       
       logformat squid_custom_log %ts.%03tu %6tr %{X-Forwarded-For}>h %Ss/%03Hs %<st %rm %ru  %un %Sh/%<A %mt "%{Referer}>h" "%{User-Agent}>h" %{Cookie}>h
       
       cache_access_log /data/proclog/log/squid/access.log squid_custom_log
       
       strip_query_terms off
       
       logfile_rotate 0
       
       cache_log /data/proclog/log/squid/cache.log
       
       cache_store_log none
       
       http_port 80 accel vhost vport allow-direct
       
       icp_port 0
       
       snmp_port 3401
       
       cache_effective_user squid 
       
       cache_effective_group squid
       
       pid_filename /var/run/squid.pid
       
       diskd_program /usr/local/squid/libexec/diskd
       
       unlinkd_program /usr/local/squid/libexec/unlinkd
       
       acl noc_pic url_regex -i ^http://.*\/do_not_delete\/noc.gif
       
       no_cache deny noc_pic
       
       acl noc_acl req_header User-Agent ChinaCache-NOC
       
       no_cache deny noc_acl
       
       half_closed_clients off
       
       server_http11 on
       
       mod_errorpage on
       
       mod_httpversion Accept-Encoding allow all
       
       mod_refresh on
       
       dns_nameservers 127.0.0.1
       
       mod_header 3 del Powered-By-ChinaCache allow all
       
       header_access X-Real-IP deny all
       
       header_access X-Forwarded-For deny all
       
       hosts_file /usr/local/squid/etc/hosts
       
       client_db off
       
       cachemgr_passwd test4squid config
       
       cache_mgr support@chinacache.com
       
       dns_testnames original1.chinacache.com original2.chinacache.com
       
       refresh_pattern -i  ^http://www.weather.com.cn/    120   0%  120   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://junshi.daqi.com/    30   0%  30   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://jxrb.cnjxol.com/    60   0%  60   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://.*\.(html|htm|shtml)    10   0%  10   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://www.nhzj.com/    60   0%  60   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://www.xc.zj.cn/.*\.html    10   0%  10   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://www.xc.zj.cn/    120   0%  120   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http://.*.fccs.com/.*\.(wmv|mpg|mpeg|avi|asf|jpg|jpeg|bmp|gif|ico|png|mp3|wma|mid|js|css|txt|rar|exe|doc|zip|ppt|xls|pdf)    60   0%  60   ignore-reload override-lastmod
       
       refresh_pattern -i  ^http    1440   0%  1440   ignore-reload override-lastmod
       
