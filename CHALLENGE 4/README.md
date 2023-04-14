## Step 1: Falco

*Click on Falco icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Install the 'falco' utility on the controlplane node and start it as a systemd service

Refer to this [article](https://v0-31.falco.org/docs/getting-started/installation/ "Falco installation") for Falco installation guide.

We will install Falco v0.31.1, latest version of Falco does not passes the 'Check' of the lab, maybe the lab is configured to work with this version itself. (Please create a PR if you are able to successfully pass the 'Check' with latest version of Flaco.)

Installation guide for latest version of Falco can be found [here](https://falco.org/docs/getting-started/try-falco/try-falco-on-ubuntu/ "Falco installation").

As mentioned in the guilde, run the following command to install Falco.

```bash
root@controlplan$ curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
root@controlplan$ echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
root@controlplan$ apt-get update -y
root@controlplan$ apt-get -y install linux-headers-$(uname -r)
root@controlplan$ apt-get install -y falco
root@controlplan$ systemctl start falco
```

You can click on the 'Check' button to verify that this task is now completed.

## Step 2: file-output

*Click on file-output icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Configure falco to save the event output to the file '/opt/falco.log'

A simple Google search on 'Configure falco to save event output to a file' will help you land to the relevant [article](https://falco.org/docs/reference/daemon/config-options/ "Falco config options") from Falco's documentation.

file_output option is the relevant option for our use case.

Create a log file for Falco to save the event output using the following command.

```bash
root@controlplan$ touch /opt/falco.log
```

Edit the falco.yaml file to enable file output. But first you need to know the location of falco.yaml file, again a simple Google search on 'location of falco.yaml file' will give you the answer.

```bash
root@controlplan$ vim /etc/falco/falco.yaml
```

![images](../pictures/4/2_1_1.PNG)

Whenever any change is made to a service, it is a good practice to restart it, so, restart Falco service using the following command.

```bash
root@controlplan$ systemctl restart falco
```

You can click on the 'Check' button to verify that this task is now completed.

## Step 3: Auditing

*Click on Auditing icon present in the interactive architecture diagram in the challenge lab*

### Task 1: The audit policy file should be stored at '/etc/kubernetes/audit-policy.yaml'

We need to configure auditing in this cluster. Let's first create an audit policy file using the following command.

```bash
root@controlplan$ touch /etc/kubernetes/audit-policy.yaml
```

You can click on the 'Check' button to verify that this task is now completed.

### Task 2: Use a volume called 'audit' that will mount only the file '/etc/kubernetes/audit-policy.yaml' from the controlplane inside the api server pod in a read only mode.

Refer to this [article](https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/#log-backend "Auditing in Kubernetes") on how to mount audit-policy.yaml file.

Edit the kube-apiserver manifest file and make the following changes.

```bash
root@controlplan$ vim /etc/kubernetes/manifests/kube-apiserver.yaml
```

![images](../pictures/4/3_2_1.PNG)

![images](../pictures/4/3_2_2.PNG)

![images](../pictures/4/3_2_3.PNG)

Save the file and exit.

You can click on the 'Check' button to verify that this task is now completed.

### Task 3: Create a single rule in the audit policy that will record events for the 'two' objects depicting abnormal behaviour in the 'citadel' namespace. This rule should however be applied to all 'three' namespaces shown in the diagram at a 'metadata' level. Omit the 'RequestReceived' stage.

Paste the content of audit-policy.yaml file present in this directory.

```bash
root@controlplan$ vim /etc/kubernetes/audit-policy.yaml
```

![images](../pictures/4/3_1_1.PNG)

Save and exit.

Refer to this [article](https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/ "Auditing in Kubernetes") for a guide to Kubernetes auditing.

Dissecting the audit-policy.yaml file: pod and configmap shows abnormal behaviour in citadel namespace, hence, they are set in resouces. As given in task statement, level will be metadata, namespace will be all three and RequestReceived stage has to be omitted.

You can click on the 'Check' button to verify that this task is now completed.

## Step 4: audit-log

*Click on audit-log icon present in the interactive architecture diagram in the challenge lab*

### Task 1: audit-log-path set to '/var/log/kubernetes/audit/audit.log'

This task is very similar to task 2 of step 3.

Refer to this [article](https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/#log-backend "Auditing in Kubernetes") on how to set audit-log-path.

Edit the kube-apiserver manifest file and make the following changes.

```bash
root@controlplan$ vim /etc/kubernetes/manifests/kube-apiserver.yaml
```

![images](../pictures/4/4_1_1.PNG)

![images](../pictures/4/4_1_2.PNG)

![images](../pictures/4/4_1_3.PNG)

Save the file and exit.

You can click on the 'Check' button to verify that this task is now completed.

## Step 5: Security Report

*Click on Security Report icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Inspect the API server audit logs and identify the user responsible for the abnormal behaviour seen in the 'citadel' namespace. Save the name of the 'user', 'role' and 'rolebinding' responsible for the event to the file '/opt/blacklist_users' file (comma separated and in this specific order).

You can click on the 'Check' button to verify that this task is now completed.

### Task 2: Inspect the 'falco' logs and identify the pod that has events generated because of packages being updated on it. Save the namespace and the pod name in the file '/opt/compromised_pods' (comma separated - namespace followed by the pod name)

You can click on the 'Check' button to verify that this task is now completed.

## Step 6: Pod (omega)

*Click on pod icon present in the omega namespace in the interactive architecture diagram in the challenge lab*

### Task 1: Delete pods belonging to the 'omega' namespace that were flagged in the 'Security Report' file '/opt/compromised_pods'. Do not delete the non-compromised pods!

You can click on the 'Check' button to verify that this task is now completed.

## Step 7: Role 

*Click on role icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Delete the role causing the constant deletion and creation of the configmaps and pods in this namespace. Do not delete any other role!

You can click on the 'Check' button to verify that this task is now completed.

## Step 8: Role Binding 

*Click on rb icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Delete the rolebinding causing the constant deletion and creation of the configmaps and pods in this namespace. Do not delete any other rolebinding!

You can click on the 'Check' button to verify that this task is now completed.

## Step 9: Pod (eden-prime) 

*Click on pod icon present in the eden-prime namespace in the interactive architecture diagram in the challenge lab*

### Task 1: Delete pods belonging to the 'eden-prime' namespace that were flagged in the 'Security Report' file '/opt/compromised_pods'. Do not delete the non-compromised pods!

You can click on the 'Check' button to verify that this task is now completed.