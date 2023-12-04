---
title: AWS Fargate Only EKS Cluster with Terraform
description: Learn to create AWS Fargate Only EKS Cluster with Terraform
---

# Verify Pods 
kubectl -n kube-system get pods
Observation: Should see coredns pods in pending state

# Run the following command to remove the eks.amazonaws.com/compute-type : ec2 annotation from the CoreDNS pods.
kubectl patch deployment coredns \
    -n kube-system \
    --type json \
    -p='[{"op": "remove", "path": "/spec/template/metadata/annotations/eks.amazonaws.com~1compute-type"}]'

# Delete & Recreate CoreDNS Pods so that they can get scheduled on Fargate 
kubectl rollout restart -n kube-system deployment coredns

# Verify Pods 
kubectl -n kube-system get pods
Observation: 
1. Wait for a minute or two
2. Should see coredns pods in Running state

# Verify Worker Nodes
kubectl get nodes
Observation: Should see two Fargate nodes related to CoreDNS running



