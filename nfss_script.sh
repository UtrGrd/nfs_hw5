#!/bin/bash
sudo su
yum install nfs-utils
systemctl enable firewalld --now
systemctl status firewalld
firewall-cmd --add-service="nfs3" --add-service="rpc-bind" --add-service="mountd" --permanent
firewall-cmd --reload
systemctl enable nfs --now
mkdir -p /srv/share/upload
chown -R nfsnobody:nfsnobody /srv/share
chmod 0777 /srv/share/upload
echo "/srv/share/ 192.168.50.11/32(rw,sync,root_squash)" >> /etc/exports
exportfs -r