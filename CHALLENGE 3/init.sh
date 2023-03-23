#!/bin/bash

curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o /opt/kube-bench.tar.gz
tar -xvf /opt/kube-bench.tar.gz -C /opt/
mv /opt/kube-bench /usr/local/bin/
mkdir -p /var/www/html/
touch /var/www/html/index.html
sudo kube-bench --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html


# ssh node01
# echo "protectKernelDefaults: true" >> /var/lib/kubelet/config.yaml
# logout