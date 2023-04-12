## Step 1: Download & run kube-bench

*Click on kube-bench icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Download 'kube-bench' from AquaSec and extract it under '/opt' filesystem. Use the appropriate steps from the kube-bench docs to complete this task.

Open the [kube-bench install docs](https://github.com/aquasecurity/kube-bench/blob/main/docs/installation.md "install kube-bench") 

#### Method 1 (which doesn't work)

Run the following command to find out the OS version of the controlplane node

```bash
root@controlplane$ cat /etc/os-release
```

It is an Ubuntu VM.

As per kube-bench install docs, below mentioned two commands should install kube-bench on controlplane, but it throws error for me.

```bash
root@controlplane$ curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.deb -o kube-bench_0.6.2_linux_amd64.deb
root@controlplane$ sudo apt install ./kube-bench_0.6.2_linux_amd64.deb -f
```

![images](../pictures/3_kube-bench_1.PNG)

If you look at the error, it says that there is an error creating diretory at /etc/kube.... . This means that this method of installtion extracts the kube-bench in /etc folder and is missing required directories. As per question, we have to extract kube-bench under /opt filesystem. So, this method will not work for our use case. Even if you try to run these commands inside /opt directory, it will still throw an error (I'll leave that as an exercise for you to perform). For sure, there must be some resolution to the above mentioned errors, but that is not our goal here, so will move to the second method. (in case if you find a solution for the above mentioned error, please create a PR)

#### Method 2 (which does work)

Manually download and extract the kube-bench binary.

Run the following command to move to the /opt directory

```bash
root@controlplane$ cd /opt/
```

Run the following command to download the binary

```bash
root@controlplane$ curl -L https://github.com/aquasecurity/kube-bench/releases/download/v0.6.2/kube-bench_0.6.2_linux_amd64.tar.gz -o kube-bench_0.6.2_linux_amd64.tar.gz
```

Run the following command to extract the binary

```bash
root@controlplane$ tar -xvf kube-bench_0.6.2_linux_amd64.tar.gz
```

See the below screenshot, config files are now present in cfg directory.

![images](../pictures/3_kube-bench_2.PNG)

You can click on the 'Check' button to verify that the first task is now completed.

If you try to install the latest version of the binary like v0.6.13-rc, you will be able to complete both tasks in this step, but the 'Check' fails to pass. Probably because the way evaluation logic for this lab is implemented is aligned with the default version mentioned in the aquasec docs. (If you find any other reason, then as always, please create a PR to include your findings)

### Task 2: Run 'kube-bench' with config directory set to '/opt/cfg' and '/opt/cfg/config.yaml' as the config file. Redirect the result to '/var/www/html/index.html' file.

Run the following command to make a directory to store the results

```bash
root@controlplane$ mkdir -p /var/www/html/
```

Run the following command to store the result of kube-bench command. (this command is also mentioned in the installation doc)

```bash
root@controlplane$ ./kube-bench run --config-dir /opt/cfg --config /opt/cfg/config.yaml > /var/www/html/index.html
```

You can click on the 'Check' button to verify that both the tasks related to kube-bench are now completed.

## Step 2: Fix issues on kubelet (node)

*Click on kubelet (node) icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Ensure that the --protect-kernel-defaults argument is set to true (node01)

The result of kube-bench command is stored at /var/www/html/index.html, we will refer to this file to get the remediation steps for all the issues in all the components in this lab.

Run the following command to know the details of CIS control corresponding to this task 

```bash
root@controlplane$ cat /var/www/html/index.html | grep -i protect-kernel-defaults
```

![images](../pictures/3_kubelet-node_2.PNG)

In the above image, note the control number, 4.2.6. Now let's see this control in detail. Open /var/www/html/index.html in VIM editor and search for 4.2.6 by typing '/4.2.6' and then press return, press 'n' to go to the next occurence of the string.

```bash
root@controlplane$ vim /var/www/html/index.html
```

![images](../pictures/3_kubelet-node_3.PNG)

![images](../pictures/3_kubelet-node_4.PNG)

There are two occurences of '4.2.6', in the above image you can see the remediation steps mentioned. Now we will implement these steps to remediate this issue from the worker node.

Run the below command to know the exact name of the worker node

```bash
root@controlplane$ kubectl get nodes
```

![images](../pictures/3_kubelet-node_1.PNG)

Run the following command to SSH to node01 

```bash
root@controlplane$ ssh node01
```

![images](../pictures/3_kubelet-node_4.PNG)

As per the above image, there are two ways to resolve this issue, we will use the kubelet config file and add 'protectKernelDefaults: true' to the file.

Let's first locate the kubelet config file. Run the below command to find the location of kubelet config file.

```bash
root@node01$ ps -ef | grep kubelet
```

![images](../pictures/3_kubelet-node_5.PNG)

In the above image, notice the location highlighted, '/var/lib/kubelet/config.yaml'

Open the kubelet config file in VIM using the below command

```bash
root@node01$ vim /var/lib/kubelet/config.yaml
```

Insert 'protectKernelDefaults: true' at the end of the kubelet config file and save the changes made.

![images](../pictures/3_kubelet-node_6.PNG)


Now run the below two commands to reload the daemon and restart kubelet service

```bash
root@node01$ systemctl daemon-reload
root@node01$ systemctl restart kubelet.service
```

Run the following command to exit from node01.

```bash
root@node01$ exit
```

You can click on the 'Check' button to verify that this task is now completed.

## Step 3: Fix issues on kubelet (controlplane node)

*Click on kubelet (controlplane) icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Ensure that the --protect-kernel-defaults argument is set to true (controlplane)

## Step 4: Fix issues on kube-controller-manager

*Click on kube-controller-manager icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Ensure that the --profiling argument is set to false

## Step 5: Fix issues on etcd

*Click on etcd icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Correct the etcd data directory ownership

## Step 6: Fix issues on kube-scheduler

*Click on kube-scheduler icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Ensure that the --profiling argument is set to false

## Step 7: Fix issues on kube-apiserver

*Click on kube-apiserver icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Ensure that the --profiling argument is set to false

### Task 2: Ensure PodSecurityPolicy admission controller is enabled

### Task 3: Ensure that the --insecure-port argument is set to 0

### Task 4: Ensure that the --audit-log-path argument is set to /var/log/apiserver/audit.log

### Task 5: Ensure that the --audit-log-maxage argument is set to 30

### Task 6: Ensure that the --audit-log-maxbackup argument is set to 10

### Task 7: Ensure that the --audit-log-maxsize argument is set to 100