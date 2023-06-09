# Update the Dockerfile, dev-webapp/dev-webapp.yaml, staging-webapp/staging-webapp.yaml, prodNamespace/deployment.yaml, prodNamespace/netpol.yaml, prodNamespace/secret.yaml
# and execute this bash script to solve the challenge in a single go.

cd webapp
mkdir app
mv app.py app
mv requirements.txt app/
mv templates/ app/
docker build -t kodekloud/webapp-color:stable .

cd ..

kubectl delete pod -n dev dev-webapp ##--force --grace-period=0
kubectl apply -f dev-webapp.yaml
kubectl delete pod -n staging staging-webapp ##--force --grace-period=0
kubectl apply -f staging-webapp.yaml

kubectl delete deployment -n prod prod-web ##--force --grace-period=0
kubectl apply -f secret.yaml
kubectl apply -f depl.yaml
kubectl apply -f netpol.yaml