#!/bin/bash

# These iptables rules will route traffic to the mitmproxy
add_firewall_rules () {
  echo "Setting up firewall rules"
  sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j REDIRECT --to-port 8080
  sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp -m tcp --dport 443 -j REDIRECT --to-port 8080
  echo "Done"
}

remove_firewall_rules () {
  echo "Removing firewall rules"
  sudo iptables -t nat -D PREROUTING -i wlan0 -p tcp -m tcp --dport 80 -j REDIRECT --to-port 8080
  sudo iptables -t nat -D PREROUTING -i wlan0 -p tcp -m tcp --dport 443 -j REDIRECT --to-port 8080
  echo "Done"
}

# Setup
add_firewall_rules

# Post Capture Steps
post_capture () {
  remove_firewall_rules
}

# Capture and upload to CloudShark
trap 'kill %1; kill %2; post_capture' SIGINT; \
  #sudo tcpdump -i eth0 -w ${capture_file} ${capture_filter} & \
  #MITMPROXY_SSLKEYLOGFILE="${keylog_file}" mitmdump -m transparent --showhost --no-http2
  mitmweb --mode transparent --web-port 9090 --web-host 0.0.0.0


