#!/bin/bash

i3status | while :
(read line && echo $line && read line && echo $line i) do
  read line
  vpn_ip=$(ifconfig tun0 | grep "inet addr" | awk '{print $2}' | awk -F':' '{print $2}')
  vpn_ip="[{ \"full_text\": \"${vpn_ip}\" },"
  echo "${line/[/$vpn_ip}" || exit 1
done
