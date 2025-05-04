# Container Orchestration with Kubernetes

Here we will learn about


1. Introduction to K8s
2. Main K8s components
3. Minikube & kubectl - Local Setup
4. Main kubectl commands
5. YAML Configuration File
6. Demo Project - 01 (Using of services)
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
kubectl config get-contexts
kubectl config get-contexts -o name
kc config use-context <context_name>


kubectl get namespaces
kubectl get nodes
kubectl get pod
kubectl get services
kubectl get replicaset
kubectl get deployment
kubectl get secret


## Debugging

kubectl logs <pod_name>
kubectl describe pod <pod_name>
kebectl exec -it <pod_name> --bin/bash


# Create POD
kubectl create -f nginx-pod.yaml

## Manually apply changes to deployment using files
kebectl apply -f <config-file.yaml>
kebectl apply -f nginx-deployment.yaml

## After editing anything to deployment, we need to apply those changes, with same command

```




## 5. YAML Configuration File

Each conf file has 3 major part.

1. metadata
2. specification
3. status.


Attributes of "spec" are specific to the kind. Deployment & Service have their own attributes in specification.


Status is automatically generated and added by k8s.



Layers of Abstraction

1. Deployment manage Pods.
2. 

Connecting component (Labels & Selectors & Ports)

Labels & Selector

metadata part contains labels.
spec part contains selectors.

Service > spec > selector > app name should same as
Deployment > metadata >  labels app name and 
Deployment > spec > template > metadata > labels > app name

Service's targetPort should same Deployment's containerPort should same.


To get more info about pod
```sh
kubectl get pod -o wide
```

To get deployment status
```sh
kubectl get deployment nginx-deployment -o yaml > nginx-deployment-status.yaml
```



## 6. Demo Project - 01 (Using of services)

Done [url]


## 7. Organize components - Namespace

Namespace -> NS ~ ns

- Virtual Cluster inside a k8s cluster.


```sh
kubeclt get namespace
```

4 ns by default.

1. default
2. kube-node-lease
3. kube-public
4. kube-system
5. kubernetes-dashboard (only minikube specific, not available in production cluster)




- kube-system ns is used for system process. User should not deploy anything in this ns.
- kube-public ns is used for publicely acessible data. A configmap, which container cluster info.

```sh
kubectl cluster-info
```
This info comes from kube-public ns.


- kube-node-lease
   - heartbit of nodes
   - each node has associated lease object in ns
   - determines the availability of a node


- default ns, comes with installations.

```sh
kubectl create namespace my-namespace
```

But good practice is creating using config file.

```sh
kind: Namespace
```

But why we need namespaces?


1. Resources should grouped in Namespaces
   - Database ns
   - Monitoring ns
   - Elastic Stack ns
   - Nginx-Ingress ns
   - Logging ns

2. Conflict with naming, many teams, same application
   - prod-frontend
   - hermes
   - p-stageenv

3. Resource sharing: staging & development

4. Blue/Green Deployment

5. Access & Resource limits on Namespaces
   - Each team has their own, secure, isolated environment
   - Limit: CPU, RAM, Storage per NS. Resource Quota A, Resource Quota B

Summary: Why we should use NS

1. Structure your component
2. Avoid conflict between teams
3. Share service between different environment
4. Access & Resource Limits on NS level



Scenario or Characteristics of NS

1. Each NS must define own configmap, secret
2. Volumne is not namespaced. It is globally live inside cluster.

```sh
kubectl api-resources --namespaced=false
kubectl api-resources --namespaced=true
```

When no ns is defined, it is going to default ns.


Both are same.
```sh
kc get configmap -n default
kc get configmap
```


To create configmap in a particular ns
```sh
kc apply -f mysql-configmap.yaml --namespace=my-namespace
```

But it is good to write a config file 

To get configmap from that namespace

```sh
kc get configmap -n my-namespace
```


To change active namespace. kubens helps us to do this. This is not from k8s. 

```sh
brew install kubectx
kubens  // to list and see active ns
kubens my-namespace // to change active ns
```


## 8. Configure connectivity - Service

Service Types
1. ClusterIP Service
2. Headless Service
3. NodePort Service
4. LoadBalancer Service

- Pods comes with it's own IP address. But Pods are ephemeral - they are destroyed frequently.
- Service have
   - Stable IP Address
   - loadbalancing by default
   - loose coupling
   - can connect within & outside from/to cluster


1. ClusterIP Service

This is a default type. When we create without specify type, then ClusterIP service will create.

Service in K8s is just like a component like pod. But it's not a process, it's an abastraction.

Service have an ip address & port.

1. How does service know, which Pods to forward the request to? - Answer is selector

** labels of Pods should match with selector of service.

** Pods er label ta just a key-value pair. amra iccha moto name dite pari.

** Service tar selector a thaka shob key value pair gulan deployment a match korar try korbe. jodi pay, tahole seigulan register korbe & endpoint banabe, jeno request forward korte pare.


But if any pod has multiple ports opened, then what? Where service will forward that request?

```sh
targetPort: 3000
```

using targetPort attribute, service will know that it forward that request to 3000 port.


Btw, we can create multiple containers inside a pod. One is main or application another called side-car container. 



```sh
kc get endpoints
```

K8s create Endpoint object, same name as Service.

To keep track of, which Pods are the member/endpoint of the service.




```sh
port: 3200
```

Port is arbitary for service.
But targetPort must match with the container listening at.



Multi Port Service

Suppose, our app service now need to talk with db service. So, we will create another service for that. Let's say, mongodb pod has another container, "mongodb-exporter" for metrics. And that container is listenting at 9216 port.

So, if I have a prometheus then, it should connect through db service. So, db service have to have open two port. One for database container, another for metrics exporter.

How k8s handle that? 

Need to add name attribute for multiple port.

- name: mongodb
- name: mongodb-exporter



2. Headless Service

What if, client needs to talk with a one specific pod directly. This happend with stateful applications. Because, pod relicas are not identical.

- Client need to talk with 1 specific pod directly (Master DB)
- Pods wants to talk directly with specific pod.
- So, not randomly selected.
- Use case: Stateful applications, like databases.

So, how can we figure out IP of pod?

Option -1 

k8s api call. But this is too tied to k8s api. Inefficient.

Option - 2

DNS Lookup

DNS Lookup for service - returns single IP address (ClusterIP)

But if we set clusterIP to none - then DNS Lookup returns Pod IP address instead. Which is our requirement.

```sh
spec:
   clusterIP: None
```

So, when we deploy stateful application, we need to create 2 services.

ClusterIP for load balancing between read-replica.
Headless for write in master db directly or read-replica to master directly for synchronization.



3. NodePort Service

External traffic has direct access to fixed port on each Worker Node.

```sh
nodePort: 30008
```

Range: 30000 - 32767

curl http://<worker_node_ip>:nodePort

When nodePort service is created, ClusterIP Service is automatically created.

But nodePort is not much secure, because, we're exposing worker ip to outside world.



4. LoadBalancer Service

Load Balancer services becomes accessible externally through cloud provider LoadBalancer.

AWS, Azure, GCP all has native loadbalancer service.

When we create LoadBalancer Service type, NodePort & ClusterIP service created automatically.


- LoadBalancer Service is an extension of NodePort Service.
- NodePort Service is an extension of ClusterIP Service.


In real k8s cluster, we never use nodeport service. It just for a quick debug/test that node is accessible or not.


Ingress & LoadBalancer is in same layer, same position. 

Ingress is k8s own service.
LoadBalancer is also k8s own service but it uses cloud providers api.

I need to understand it more deeply.