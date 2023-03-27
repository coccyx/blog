#!/bin/bash
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.68.20:80PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.68.20:80
sudo iptables ! -o lo -t nat -A POSTROUTING -j MASQUERADE


# For forwarding localhost
# From: http://realtechtalk.com/iptables_how_to_forward_localhost_port_to_remote_public_IP-1788-articles
sudo iptables -t nat -A OUTPUT -m addrtype --src-type LOCAL --dst-type LOCAL -p tcp --dport 8000 -j DNAT --to-destination 192.168.68.20:80
sudo iptables -t nat -A POSTROUTING -m addrtype --src-type LOCAL --dst-type UNICAST -j MASQUERADE
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
echo "net.ipv4.conf.all.route_localnet=1" | sudo tee -a /etc/sysctl.conf
sudo apt install iptables-persistent
sudo iptables-save | sudo tee /etc/iptables/rules.v4
