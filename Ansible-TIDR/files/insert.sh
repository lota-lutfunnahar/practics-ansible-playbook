#!/bin/bash


file="/etc/logstash/conf.d/output.conf"



pass="$1"




(cat $file; echo ) | while read -r line; do

    echo -e "${line//'abcd12345'/$pass}"

done > /etc/logstash/conf.d/99-output.conf

#mv /tmp/file.txt{.t,}
