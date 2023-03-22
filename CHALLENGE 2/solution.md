https://www.geeksforgeeks.org/docker-user-instruction/

https://www.geeksforgeeks.org/docker-copy-instruction/

find out all the shells of a container by running the following command
kubectl exec -it -n dev dev-webapp -- /bin/sh
cat /etc/shells
now in the startup probe write a command to remove those shells as soon as the container is started so that no one can exec into the pod