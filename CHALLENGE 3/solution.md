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
systemctl restart kubelet.service

################################################