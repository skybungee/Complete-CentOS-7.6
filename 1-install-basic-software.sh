#!/bin/bash
set -e
##################################################################################################################
# Written to be used on 64 bits computers and CentOS
# Author 	: 	Matthew Bingham
# Website 	: 	http://mbtech.bing14.net
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

#install software from 'normal' repositories
# This is to allow to use sosreport within cockpit
yum install -y sos

# This is to install cockpit and different (services within cockpit)
yum install -y cockpit-bridge cockpit-ws cockpit-packagekit cockpit-doc cockpit-pcp cockpit-system-176 cockpit-176 cockpit-storaged cockpit-dashboard

# This is to start the cockpit service and enable for it too start on reboot
systemctl start cockpit.socket
systemctl enable cockpit.socket

# This is to add firewall rules to allow access to the port 9090

firewall-cmd --add-port=9090/tcp
firewall-cmd --permanent --add-port=9090/tcp

###############################################################################################
echo "################################################################"
echo "###################   Basic software installed   ###############"
echo "################################################################"
