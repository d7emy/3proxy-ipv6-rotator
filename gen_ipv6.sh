array=( 1 2 3 4 5 6 7 8 9 0 a b c d e f )
MAXCOUNT=[PROXY COUNT]
count=1
network=[IPV6 SUBNET ADDRESS FOR EXAMPE: 2a03:414d]
skgen=32
vlstd=[YOUR ETHERNET]
rnd_ip_block ()
{
    a=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    b=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    c=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    d=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    f=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    e=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    k=${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}${array[$RANDOM%16]}
    echo $network:$b:$f:$c:$d:$e:$k >> /root/ip.list
	  echo -n "/sbin/ip -6 addr add $network:$b:$f:$c:$d:$e:$k/32 dev $vlstd & " >> /root/ip.list2.sh
	  echo -n "/sbin/ip -6 addr del $network:$b:$f:$c:$d:$e:$k/32 dev $vlstd & " >> /root/ip.list3.sh
}

while [ "$count" -le $MAXCOUNT ]
do
        rnd_ip_block
        let "count += 1"
done


