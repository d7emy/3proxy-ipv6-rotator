port=30000
count=1
while IFS= read -r line3 <&3 || ((eof3=1))
      !((eof3))
do
                echo "proxy -6 -n -a -ocUSE_TCP_FASTOPEN -p$port -i45.159.189.78 -e$line3"
        ((port+=1))
        ((count+=1))
        if [ $count -eq 90001 ]; then
                exit
		fi
done 3<ip.list


