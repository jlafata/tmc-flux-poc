./setup-secrets.sh
kubectl apply -f resource-claims-cluster-role-postgres.yaml
kubectl apply -f cluster-instance-class-postgres.yaml
kubectl apply -f resource-claim-policy-postgres.yaml