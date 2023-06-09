## Falco

curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update -y
apt-get -y install linux-headers-$(uname -r)
apt-get install -y falco
systemctl start falco

###################################################################################################

## file-output ke liye manually karo
touch /opt/falco.log

## audit log
mkdir -p /var/log/kubernetes/audit/
touch /var/log/kubernetes/audit/audit.log
