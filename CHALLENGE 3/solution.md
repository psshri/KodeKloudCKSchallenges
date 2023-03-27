https://www.tenable.com/audits/items/CIS_Kubernetes_v1.6.1_Level_1_Worker.audit:b6fa04881049d6a566d437e3f736cbb4

https://devopscube.com/kube-bench-guide/

https://www.youtube.com/watch?v=f6dV9eVBOAc


########################## click on 'kube-bench'

curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o /opt/kube-bench.tar.gz

tar -xvf /opt/kube-bench.tar.gz -C /opt/

mv /opt/kube-bench /usr/local/bin/

mkdir -p /var/www/html

touch /var/www/html/index.html

sudo kube-bench --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html

############################## click on 'kubelet' node 

vim /var/lib/kubelet/config.yaml
protectKernelDefaults: true.

systemctl daemon-reload
systemctl restart kubelet

###### click on 'kubelet' controlplane node (not working right now)

vim /var/lib/kubelet/config.yaml
protectKernelDefaults: true.

systemctl daemon-reload
systemctl restart kubelet

###### click on 'kube-controller-manager' (not working right now)

vim /etc/kubernetes/manifests/kube-controller-manager.yaml
- --profiling=false

###### click on 'etcd' controlplane node (not working right now)
stat -c %U:%G /var/lib/etcd
chown etcd:etcd /var/lib/etcd
stat -c %U:%G /var/lib/etcd


###### click on 'kube-scheduler' controlplane node (not working right now)
vim /etc/kubernetes/manifests/kube-scheduler.yaml
- --profiling=false

###### click on 'kube-apiserver' controlplane node (not working right now)

mkdir -p /var/log/apiserver/
touch /var/log/apiserver/audit.log

https://stackoverflow.com/questions/59054407/how-to-enable-admission-controller-plugin-on-k8s-where-api-server-is-deployed-as

https://kubevious.io/blog/post/securing-kubernetes-using-pod-security-policy-admission-controller

PodSecurityPolicy ke liye PSP yaml file, role and rolebinding bhi banana hoga

vim /etc/kubernetes/manifests/kube-apiserver.yaml
- --profiling=false
- --enable-admission-plugins=NodeRestriction,PodSecurityPolicy
- --insecure-port=0
- --audit-log-path=/var/log/apiserver/audit.log
- --audit-log-maxage=30
- --audit-log-maxbackup=10
- --audit-log-maxsize=100


kal kubebench install karke ek ek karke check karna ki kube-apiserver.yaml wale file se konsi line problematic hai