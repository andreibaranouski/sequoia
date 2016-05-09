FILE=$1
CONTAINER_IPS=($(cat /etc/hosts | grep container | awk '{print $1}' | sort))
i=0
for host in $( grep ip: $FILE | awk -F ":" '{print $2}' ); do
  addr=${CONTAINER_IPS[i]}
  echo $host."->".$addr
  sed -i "0,/ip:$host/s//ip:$addr/" $FILE

 ((i++))
done
