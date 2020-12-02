#!/bin/bash
file=src/test/resources/netex_reusableComponents/netex_facility_support.xsd
java -jar target/xsd2owl-1.0.0.jar  -x $file -o output/$(basename $file ).rdf