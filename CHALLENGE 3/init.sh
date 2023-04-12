## kube-bench

cd /opt/
curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o kube-bench_0.6.2_linux_amd64.tar.gz
tar -xvf kube-bench_0.6.2_linux_amd64.tar.gz
mkdir -p /var/www/html/
./kube-bench run --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html