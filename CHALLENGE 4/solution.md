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

vim /etc/falco/falco.yaml
file_output:
  enabled: true
  keep_alive: false
  filename: /opt/falco.log

run the following command
systemctl restart falco

##################################

click on Auditing


touch /etc/kubernetes/audit-policy.yaml
vim /etc/kubernetes/audit-policy.yaml
paste the content of audit-policy.yaml

edit kube-apiserver.yaml file too
vim /etc/kubernetes/manifests/kube-apiserver.yaml
paste content from kube-apiserver.yaml

###############################

click on Security Report

cat /opt/falco.log | grep -i package

vim /opt/compromised_pods
eden-prime,eden-software2


cat /var/log/kubernetes/audit/audit.log | grep -i role

vim /opt/blacklist_users
agent-smith,important_role_do_not_delete,important_binding_do_not_delete

###################################3
now simply run the following commands to delete correct pod, role, rolebinding

kubectl delete role -n citadel important_role_do_not_delete
kubectl delete rolebinding -n citadel important_binding_do_not_delete 
kubectl delete pod -n eden-prime eden-software2 --grace-period=0 --force