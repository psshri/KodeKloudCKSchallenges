## Step 1: Falco

*Click on Falco icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Install the 'falco' utility on the controlplane node and start it as a systemd service



You can click on the 'Check' button to verify that this task is now completed.

## Step 2: file-output

*Click on file-output icon present in the interactive architecture diagram in the challenge lab*

### Task 1: Configure falco to save the event output to the file '/opt/falco.log'

You can click on the 'Check' button to verify that this task is now completed.

## Step 3: Auditing

*Click on Auditing icon present in the interactive architecture diagram in the challenge lab*

### Task 1: The audit policy file should be stored at '/etc/kubernetes/audit-policy.yaml'

You can click on the 'Check' button to verify that this task is now completed.

### Task 2: Use a volume called 'audit' that will mount only the file '/etc/kubernetes/audit-policy.yaml' from the controlplane inside the api server pod in a read only mode.

You can click on the 'Check' button to verify that this task is now completed.

### Task 3: Create a single rule in the audit policy that will record events for the 'two' objects depicting abnormal behaviour in the 'citadel' namespace. This rule should however be applied to all 'three' namespaces shown in the diagram at a 'metadata' level. Omit the 'RequestReceived' stage.

You can click on the 'Check' button to verify that this task is now completed.

## Step 4: audit-log

*Click on audit-log icon present in the interactive architecture diagram in the challenge lab*

### Task 1: audit-log-path set to '/var/log/kubernetes/audit/audit.log'

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