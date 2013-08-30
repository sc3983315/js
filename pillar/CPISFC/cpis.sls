CPISTEST:
   12_1T:  {%  for cache in range(1,13) %}
            cache_dir coss /data/cache{{ cache }}/coss 500000 max-size=100000 block-size=4096 membufs=150 overwrite-percent=100
            
            cache_dir aufs /data/cache{{ cache }} 200000  128 128  min-size=100000
            {% endfor %}

   12_2T:  {%  for jb in range(1,13) %}
            cache_dir coss /data/cache{{ jb }}/coss 1000000 max-size=100000 block-size=4096 membufs=150 overwrite-percent=100

            cache_dir aufs /data/cache{{ jb }} 400000  128 128  min-size=100000
            {% endfor %}

DOWN: 
  12_2T:  {%  for woca in range(1,13) %}
             cache_dir aufs /data/cache{{ woca }} 1500000 128 128
           {% endfor %}
VIDEO: 
  12_2T:  {%  for wori in range(1,13) %}
             cache_dir aufs /data/cache{{ wori }} 1500000 128 128
           {% endfor %} 
