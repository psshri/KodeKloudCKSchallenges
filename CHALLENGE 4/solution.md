click on audit-log

mkdir -p /var/log/kubernetes/audit/
touch /var/log/kubernetes/audit/audit.log

######################################################

click on Falco

refer this article: https://v0-31.falco.org/docs/getting-started/installation/

the installation steps that runs successfully are from v0.31 and not from current version

curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update -y
apt-get -y install linux-headers-$(uname -r)
apt-get install -y falco

systemctl status falco
systemctl start falco
systemctl status falco

##########################################################

click on file-output

refer to this article: https://falco.org/docs/alerts/ (or https://falco.org/docs/alerts/channels/)
this will direct you to https://falco.org/docs/reference/daemon/config-options/
here look for 'file_output' and change the /etc/falco/falco.yaml file accordingly

before that run the following command
touch /opt/falco.log

file_output:
  enabled: true
  keep_alive: false
  filename: /opt/falco.log

##################################