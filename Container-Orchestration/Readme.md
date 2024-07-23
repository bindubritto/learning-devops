# Container Orchestration with Kubernetes

Here we will learn about


1. Introduction to K8s
2. Main K8s components
3. Minikube & kubectl - Local Setup
4. Main kubectl commands
5. YAML Configuration File
6. Demo Project
7. Organize components - Namespace
8. Configure connectivity - Service
9. Make app available from outside - Ingress
10. Persist data - Volumes
11. ConfigMap & Secret as Volume Types
12. Deploy stateful apps - StatefulSet
13. Package Manager of K8s - Helm
14. Extending the K8s API - Operator
15. Microservice in K8s.
16. Demo Project
17. Production & Security Best Practices
18. Demo Project: Create common Helm Chart for Microservice
19. Demo Project: Deploy Microservices with helmfile
20. Authorization in K8s - RBAC




## 1. Intro to K8s

What feature do orchestration tools offer

- High Availability or no downtime
- Scalability or high performance
- Disaster recovery - backup or restore

## 2. Main k8s components



#### Pod
- Smallest unit of K8s.
- It is an abstraction over container.
- Usually 1 application per Pod.
- Each Pod gets it's own IP address
- New IP address on re-creation


#### Service
- Let's say 2 service (app, db)
- permanent IP address 
- lifecycle of Pod & Service NOT connected
- app-service (http://my-app-service-ip:port)
- db-service (http://my-db-service-ip:port)
- Has it's own load balancer


#### Ingress
- External request comes to this (https://my-app.com)
- So, request comes to ingress, then services


#### ConfigMap
- External configuration of your application
- Pods are connected with ConfigMap
- Don't put credentials into ConfigMap


#### Secrets
- Just like ConfigMap but to store secret data
- base64 encoded
- The built-it security mechanism is not enabled by default.
- Based on 3rd party secutiry libracy, we can encrypt secrets
- Pods are connected with Secrets also, and reads data from it.


#### Volume
- Attach a physical storage on that local machine
- Or remote, outside of the K8s cluster
- K8s doesn't manage data persistance


#### Deployment
- Blueprint for my-app pods
- We create deployment, not Pod
- Abstraction of Pods
- Replica is connected with service (static IP with a load-balancer)


#### StatefulSet
- Deployment for stateLess Apps
- StatefulSet for stateFul Apps or Databases (MySQL, Postgres, elasticsearch)
- DB are often hosted outside of K8s cluster. Because, managing StatefulSet not an easy task to do.



## 2.1 Kubernetes Architechture

2 types of nodes k8s operates.
- Master
- Slave / Worker


##### Worker Node Processes

- Each Node has multiple Pods on it.
- 3 processes must be installed on every Node to manage
- worker nodes do the actual work

1. Container Runtime 

To run containerized application.

- docker
- containerd ***
- cri-o

2. Kubelet

kubelet interacts with both - the container and the node
kubelet starts the pod with a container inside


3. KubeProxy

It has intelligent request forwarding logic

Summary: 

3 main component in worker node processes.
1. Kubelet
2. Kube Proxy
3. Container Runtime



##### Master Node Processes

To manage worker node and interact with outside world. 4 proceses run on every master node.

1. Api Server
2. Scheduler
3. Controller Manager
4. etcd


1. API SERVER
- It is the cluster gateway
- acts as a gatekeeper for authentication

2. Scheduler
- Scheduler has it's own intelligence where to put the Pod.
- Scheduler just decides on which Node, a new pod should be scheduled. Then kubelet executes the request.

3. Controller Manager
- Detects cluster state changes
- CM request to Scheduler, then scheduler to kubelet

4. etcd
- a key-value store
- etcd is cluster brain




## 3. Minikube & kubectl - Local Setup

minikube is 1 node k8s cluster that runs on virtual box for testing pouposes.

- Kubectl
   To interact with k8s. K8s command line tool. kubectl



## 4. Main kubectl commands

```sh

## CRUD

kubectl create deployment nginx-deployment --image=nginx
kebectl get deployment
kubectl edit deployment nginx-deployment
kebectl delete deployment <deployment_name>


## Status of different K8s Components

kubectl get nodes
kubectl get pod
kubectl get services
kubectl get replicaset
kebectl get deployment

## Debugging

kubectl logs <pod_name>
kubectl describe pod <pod_name>
kebectl exec -it <pod_name> --bin/bash


## Manually apply changes to deployment using files

kebectl apply -f <config-file.yml>
kebectl apply -f nginx-deployment.yaml

## After editing anything to deployment, we need to apply those changes, with same command

```