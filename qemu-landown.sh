#!/bin/sh

brctl delif br-lan tap0
ifconfig tap0 down
ifconfig br-lan down
brctl delbr br-lan
