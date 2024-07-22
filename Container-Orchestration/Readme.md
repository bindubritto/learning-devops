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

## Main k8s components



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


#### Ingress
- External request comes to this (https://my-app.com)
- So, request comes to ingress, then services
