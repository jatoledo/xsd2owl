#!/bin/bash
for file in src/test/resources/netex_reusableComponents/*
do
    #echo $(basename $file )
    #/usr/bin/time -f
    time  -f "elapsed_time,kernel_mode,user_mode,memory_max,memory_average,file\n%e,%S,%U,%M,%K,$(basename $file )" -o tmp_time.csv java -jar target/xsd2owl-1.0.0.jar  -x $file -o output/$(basename $file ).rdf
    tail -1 tmp_time.csv >> time.csv
    # elapsed_time(seconds)
    # cpu_percentage[(%U + %S) / %E]
    # kernel_mode(CPU-seconds)
    # user_mode(CPU-seconds)
    # memory_max(Kbytes)
    # memory_average(Kbytes)

done
rm tmp_time.csv
curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE docker"