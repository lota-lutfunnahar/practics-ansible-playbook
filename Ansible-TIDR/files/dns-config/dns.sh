#!/bin/bash

echo "//" > named.conf
echo "// named.conf" >> named.conf
echo "//" >> named.conf
echo "// Provided by Red Hat bind package to configure the ISC BIND named(8) DNS" >> named.conf
echo "// server as a caching only nameserver (as a localhost DNS resolver only)." >> named.conf
echo "//" >> named.conf
echo "// See /usr/share/doc/bind*/sample/ for example named configuration files." >> named.conf
echo "//" >> named.conf
echo "// See the BIND Administrator's Reference Manual (ARM) for details about the" >> named.conf
echo "options {" >> named.conf

#read -p "Enter listen-on port 53 ip(With out localhost) : " ip

echo -e " \t listen-on port 53 { 127.0.0.1; $2; };"  >> named.conf
echo -e  ' \t directory       "/var/named"; '  >> named.conf
echo -e ' \t dump-file       "/var/named/data/cache_dump.db"; '  >> named.conf
echo -e ' \t statistics-file "/var/named/data/named_stats.txt"; '  >> named.conf
echo -e ' \t memstatistics-file "/var/named/data/named_mem_stats.txt"; '  >> named.conf
echo -e ' \t recursing-file  "/var/named/data/named.recursing"; '  >> named.conf
echo -e ' \t secroots-file   "/var/named/data/named.secroots"; '  >> named.conf

#read -p "Enter allow-query ip's :" q_ip
echo -e " \t allow-query     { $1 ;}; "  >> named.conf
echo -e " \t allow-recursion { $1 ;}; "  >> named.conf


echo -e " \t recursion yes;"  >> named.conf
echo -e " \t // hide bind version"  >> named.conf
echo -e ' \t version "none to check";'  >> named.conf

echo -e " \t dnssec-enable yes; "  >> named.conf
echo -e " \t dnssec-validation yes;"  >> named.conf

echo -e " \t /* Path to ISC DLV key */"  >> named.conf
echo -e ' \t bindkeys-file "/etc/named.root.key"; '  >> named.conf

echo -e ' \t managed-keys-directory "/var/named/dynamic"; '  >> named.conf

echo -e ' \t pid-file "/run/named/named.pid";'  >> named.conf
echo -e ' \t session-keyfile "/run/named/session.key";'  >> named.conf



cat /root/dns_file.txt >> named.conf
