#!/bin/sh

brctl addbr br-lan
ifconfig br-lan up
ifconfig tap0 up
brctl addif br-lan tap0
ifconfig br-lan 192.168.1.28 netmask 255.255.255.0
