#!/bin/sh

brctl delif br-wan tap1
ifconfig tap1 down
ifconfig br-wan down
brctl delbr br-wan
