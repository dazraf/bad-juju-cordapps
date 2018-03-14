#!/bin/bash

echo 'Please note: this script is for a specific resource group. If you create your own, please change update this file accordingly. Thank you.'
echo ' '
echo 'This will start up three deployments; one notary/network map and two parties (PartyA and PartyB)'
# Delete all the old components so we can start fresh
echo 'Deleting the load balancer...'
az network lb delete -g MC_groupramiz_clusterramiz1_westeurope -n kubernetes
echo 'Delete load balancer.'
echo 'Deleting existing deployments...'
kubectl delete deployments,services,pods --all
echo 'Deleted existing deployments.'

# Starting all the components (services/deployments)
echo 'Launching...'
kubectl create -f controller.yaml
kubectl create -f partya.yaml
kubectl create -f partyb.yaml
echo 'Launched!'

# Getting pod names and executing them from "outside"
# CONTROLLER_NAME=$(kubectl get pods | grep controller-deployment | cut -d ' ' -f1)
# PARTYA_NAME=$(kubectl get pods | grep partya-deployment | cut -d ' ' -f1)
# PARTYB_NAME=$(kubectl get pods | grep partyb-deployment | cut -d ' ' -f1)
# kubectl exec -it $CONTROLLER_NAME -- java -jar corda.jar
# kubectl exec -it $PARTYA_NAME -- java -jar corda.jar
# kubectl exec -it $PARTYB_NAME -- java -jar corda.jar

# Starting up a local ui dashboard
# UI Dashboard is here http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/#!/deployment?namespace=default
echo 'Starting up Web UI - http://127.0.0.1:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/#!/deployment?namespace=default'
kubectl proxy