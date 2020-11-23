#!/bin/bash

rm time.csv
echo "run,elapsed_time,kernel_mode,User_mode,memory_max,memory_average,file">>time.csv
for file in src/test/resources/netex_reusableComponents/*
do
    #echo $(basename $file )
    #/usr/bin/time -f
    echo "***** $(basename $file ) *****"
    for i in 1 2 3 4 5
    do
    time  -f "run,elapsed_time,kernel_mode,user_mode,memory_max,memory_average,file\n$i,%e,%S,%U,%M,%K,$(basename $file )" -o tmp_time.csv java -jar target/xsd2owl-1.0.0.jar  -x $file -o output/$(basename $file ).rdf
    tail -1 tmp_time.csv >> time.csv
    done
    # elapsed_time(seconds)
    # cpu_percentage[(%U + %S) / %E]
    # kernel_mode(CPU-seconds)
    # user_mode(CPU-seconds)
    # memory_max(Kbytes)
    # memory_average(Kbytes)

done
rm tmp_time.csv
#curl -G http://localhost:8086/query -u admin:admin123 --data-urlencode "q=SHOW DATABASES"