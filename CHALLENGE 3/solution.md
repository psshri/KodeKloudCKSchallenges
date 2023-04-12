
############# must include this: how to find out manifest file location
ps -ef | grep kubelet
see --config=/var/lib/kubelet/config.yaml
check out the staticPodPath from the manifest 

##########################

https://www.tenable.com/audits/items/CIS_Kubernetes_v1.6.1_Level_1_Worker.audit:b6fa04881049d6a566d437e3f736cbb4

https://devopscube.com/kube-bench-guide/


########### @@@@@@@

cd /opt/

curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o kube-bench_0.6.2_linux_amd64.tar.gz

tar -xf kube-bench_0.6.2_linux_amd64.tar.gz

mkdir -p /var/www/html/

./kube-bench run --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html

#####################################
check ke agar me neeche wale method se karta hu aur kube-bench ko usr/local/bin me move nahi karta hu bas to kya mera solution sahi hoga
########################## click on 'kube-bench'

note that you also need to download it under /opt folder, otherwise the solution will not work, that is how it is build to evaluate

curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o /opt/kube-bench.tar.gz

tar -xvf /opt/kube-bench.tar.gz -C /opt/

mv /opt/kube-bench /usr/local/bin/

mkdir -p /var/www/html

touch /var/www/html/index.html

sudo kube-bench --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html

############################## click on 'kubelet' node 

ssh node01

vim /var/lib/kubelet/config.yaml
protectKernelDefaults: true

systemctl daemon-reload
systemctl restart kubelet

exit
###### click on 'kubelet' controlplane node

vim /var/lib/kubelet/config.yaml
protectKernelDefaults: true

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

audit log path ke liye wo k8s article include karo, see @@@@@@

https://stackoverflow.com/questions/59054407/how-to-enable-admission-controller-plugin-on-k8s-where-api-server-is-deployed-as

https://kubevious.io/blog/post/securing-kubernetes-using-pod-security-policy-admission-controller

PodSecurityPolicy ke liye PSP yaml file, role and rolebinding bhi banana hoga

kubectl apply -f psp.yaml
kubectl apply -f clusterRole.yaml
kubectl apply -f clusterRoleBinding.yaml

vim /etc/kubernetes/manifests/kube-apiserver.yaml
- --profiling=false
- --enable-admission-plugins=NodeRestriction,PodSecurityPolicy
- --insecure-port=0
- --audit-log-path=/var/log/apiserver/audit.log
- --audit-log-maxage=30
- --audit-log-maxbackup=10
- --audit-log-maxsize=100

    - mountPath: /var/log/apiserver/   ### three lines no problem
      name: audit-log
      readOnly: false

  - hostPath: ##### four lines no problem
      path: /var/log/apiserver/
      type: DirectoryOrCreate
    name: audit-log

kal kubebench install karke ek ek karke check karna ki kube-apiserver.yaml wale file se konsi line problematic hai