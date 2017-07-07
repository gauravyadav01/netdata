#!/bin/bash 
# Script to install master netdata 

cp -p /vagrant/kickstart-static64.sh /tmp
/tmp/kickstart-static64.sh --dont-wait
cp -p /vagrant/master/config/stream.conf /opt/netdata/etc/netdata/stream.conf
systemctl enable netdata
systemctl restart netdata
