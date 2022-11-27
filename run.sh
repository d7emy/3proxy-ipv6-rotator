#!/bin/bash
ulimit -u unlimited -n 999999 -s 16384

service network restart

rm -rf ip.list2.sh ip.list

chmod +x gen_ipv6.sh
bash gen_ipv6.sh

rm 3proxy.cfg

cat >3proxy.cfg <<END
daemon
nserver 198.153.192.1
nserver 198.153.194.1
nscache 65536
timeouts 1 5 30 60 180 1800 15 60
setgid 65535
setuid 65535
stacksize 60000
auth nonea
allow * *
flush
END

chmod +x 1proxy.sh
bash 1proxy.sh > 2proxy.txt

cat 2proxy.txt >> 3proxy.cfg

chmod +x ip.list2.sh
bash ip.list2.sh
ulimit -u unlimited -n 999999 -s 16384
pkill 3proxy
/root/3proxy/bin/3proxy 3proxy.cfg




