optimize:  acl range_header req_header User-Agent Baiduspider

       http_access deny range_header
       
       acl NO_CGI urlpath_regex ^/cgi \? jsp
       
       cache deny NO_CGI
       
       acl eastmoney url_regex -i ^http://.*.eastmoney.com/.*\.(gif|jpg|bmp|png|jpeg|js|css|swf) ^http://.*.fccs.com/.*\.(wmv|mpg|mpeg|avi|asf|jpg|jpeg|bmp|gif|ico|png|mp3|wma|mid|js|css|txt|rar|exe|doc|zip|ppt|xls|pdf)
       
       cache allow eastmoney
       
       acl NO_CACHE_CPIS url_regex http://i2.sinaimg.cn/dy/deco/2009/1026/titPic1.png http://img.bimg.126.net/photo/Od60EdQA27-vnZ9RoicQ-w==/2005227734087683955.jpg ^http://hi.baidu.com ^http://www.163.com ^http://apps.hi.baidu.com ^http://me.360.cn ^http://happyranch.wan.360.cn ^http://reg.360.cn ^http://.*/.*\.(php|jsp|asp|aspx) ^http://.*\.500wan.com/.*\.(js|shtml|html|xml) ^http://.*\.eastmoney.com/ ^http://wap.sina.com/ ^http://.*.youku.com/ ^http://.*.fccs.com/ http://www.8u.cn/@@@$ http://www.8u.cn/@@@Accept-Encoding:gzip$ ^http://[^/]*:[0-9]*/? ^http://[^/]*/?.*\.do(@@@|@@@Accept-Encoding:gzip) ^http://www.hudong.com/wiki/
       
       cache deny NO_CACHE_CPIS
       
       acl CACHE_CPIS url_regex -i ^http://.*\.store.qq.com/ http://[^/]*/? ^http://[^/]*/?.*\.(gif|jpg|bmp|png|jpeg|js|css|txt|html|htm|shtml|mp3|mp4|flv|swf|cab|dat|dll|enc|exe|msi|pdf|psf|qgi|rar|rmvb|unp|wma|zip|zip3|aif|aiff|au|avi|bin|carb|cct|cdf|dcr|doc|dtd|gcf|gff|grv|hdml|hqx|ico|ini|mov|nc|pct|ppc|pws|swa|vbs|w32|wav|wbmp|wml|wmlc|wmls|wmlsc|xls|xsd|hlv|f4v|gzip|apk|json|aac|ipa|m4a|pak|7z|ipsw|pack|msu|MPQ|mpc|ts|gz|ndz|z|kkpt|pxl|r00|Wma|qnq|kk|jar|xy|tse|msp|crp|bz2|deb|mpak|sisx|3gp|gpk|mkv|ggi|img|afc|alc|ashx|aspx|asset|aw|cgi|fcg|xml|wsgi|spk)
       
       cache allow CACHE_CPIS
       
       cache deny all
       
       acl CPIS_HTTP_DENY url_regex http://a.hhrrr.net http://chen-ai.com http://hosted.fattyblowjobs.com http://hosted.x-art.com http://mgb.brazzers.com http://mm.0714love.com http://p.yelangwo.com http://sexya.co.cc http://wap.ce.vg http://www.1kav.com http://www.56cb.com http://www.97djr.info http://www.aeerjet.com http://www.desert6.com http://www.dghh.info http://www.dyqun.info http://www.gansiwa.tk http://www.godivatgirls.net http://www.loverdoor.com http://www.seseii.info http://www.smmtu.info http://www.vickirichter.com http://www.wanju119.bbavav.com http://www.wu2010.info http://www.ysyy.us http://www.yxboy.net http://uk.ceowb.com http://xc4.xanga.com http://www.ubint.net http://www.avqvodplayer.tk http://www.bengallovers.com http://www.gstools168.com http://www.stara55.bbavav.com http://1024.cimidi.org http://tl.zzatl.info http://www.domsexa.com http://www.michellesnylons.com http://images.china.cn 
       
       http_access deny CPIS_HTTP_DENY 
       
       acl localhost_all src 127.0.0.0/8
       
       http_access deny localhost_all
       
       mod_limit_obj_count all 5000000 allow all
       
       quick_abort_min -1 KB
       
       range_offset_limit -1 KB
       
       http_access deny to_localhost
       
       http_access allow all
       
       http_reply_access allow all
       
