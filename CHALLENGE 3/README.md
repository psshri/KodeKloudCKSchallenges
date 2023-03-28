## Step 1: Download & run kube-bench

### Task 1: Download kube-bench

### Task 2: Run kube-bench

## Step 2: Fix issues on kubelet (node)

### Task 1: Ensure that the --protect-kernel-defaults argument is set to true (node01)

## Step 3: Fix issues on kubelet (controlplane node)

### Task 1: Ensure that the --protect-kernel-defaults argument is set to true (controlplane)

## Step 4: Fix issues on kube-controller-manager

### Task 1: Ensure that the --profiling argument is set to false

## Step 5: Fix issues on etcd

### Task 1: Correct the etcd data directory ownership

## Step 6: Fix issues on kube-scheduler

### Task 1: Ensure that the --profiling argument is set to false

## Step 7: Fix issues on kube-apiserver

### Task 1: Ensure that the --profiling argument is set to false

### Task 2: Ensure PodSecurityPolicy admission controller is enabled

### Task 3: Ensure that the --insecure-port argument is set to 0

### Task 4: Ensure that the --audit-log-path argument is set to /var/log/apiserver/audit.log

### Task 5: Ensure that the --audit-log-maxage argument is set to 30

### Task 6: Ensure that the --audit-log-maxbackup argument is set to 10

### Task 7: Ensure that the --audit-log-maxsize argument is set to 100