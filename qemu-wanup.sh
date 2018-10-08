#!/bin/sh

brctl addbr br-wan
ifconfig br-wan up
ifconfig tap1 up
brctl addif br-wan tap1
