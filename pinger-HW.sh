#!/bin/bash
address=$1
maxtime=100

count=0

echo "Ping - $address"

while :
do
 if ping -c 1 $address 1>/dev/null 2>/dev/null; 
    then
      TIME=$(ping -c 1 "$address" | tail -1 | awk -F "/" '{print $6}' | awk -F"." '{print $1}')
      count=0 
      if (($TIME > $maxtime ));
         then
	 echo "Ping time to $address is over 100 ms   $TIME  ms"
      fi    
    else    
       ((count++))
       if (( count >3 )); 
         then 
             echo "Failed to ping $address " 
             exit 1
       fi
 fi     
  
 sleep 1  
 
done
