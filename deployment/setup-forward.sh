#!/bin/bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.68.20:80
sudo iptables ! -o lo -t nat -A POSTROUTING -j MASQUERADE