#!/bin/sh

URL=139.198.21.160


for i in {0..1}
do
    RES[$i]=`curl -s -I $URL | grep HTTP/1.1 | awk {'print $2'}`
done

if [[ ${RES[0]} != 200 && ${RES[0]} == ${RES[1]} ]]
then
    echo 'test'
fi
