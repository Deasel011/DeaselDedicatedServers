GCE-GKE¶
First, your user needs to have cluster-admin permissions on the cluster. This can be done with the following command:

```bash
kubectl create clusterrolebinding cluster-admin-binding \
--clusterrole cluster-admin \
--user $(gcloud config get-value account)
```

Then, the ingress controller can be installed like this:


```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.0/deploy/static/provider/cloud/deploy.yaml
```
