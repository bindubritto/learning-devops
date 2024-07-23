# 6. Kubernetes Project - 01 

## Here we will learn about most used services of K8s.

## We will setup mongo-db (database) & mongo-express (web-server) to demonstrate & use of different services.



Steps

1. We will create a mongo-db pod, and to talk with that pod, we will create an internal service so that no external request will come to that pod. Only components that are in same cluster can talk to it.

2. Then we will create mongo-express deployment. Here we need

- DB Url (ConfigMap)


We will use secret to store these
- DB User
- DB Password

and we will reference both to deployment.yaml file.



Here, secret should create before deployment create.

```sh
kubectl apply -f mongo-secret.yaml
```

Now, we can reference secrets to our deployments.


```sh
kc get pod  --watch
```


```sh
kc get all | grep mongodb
```


Again, configmap should create before deployment, as deployment is dependent with ConfigMap

```sh
kubectl apply -f mongo-configmap.yaml
```

Then 

```sh
kubectl apply -f mongo-express.yaml
```

nodePort -> 30000 - 32767, exposing port for public access.

Internal Service type = ClusterIP, which is default.
External Service type = LoadBalancer

External Service has an External IP address with a nodePort defined.

To get the External-IP, in minikube

```sh
minikube service mongo-express-service
```

Summarry

Request -> Mongo Express External Service -> Mongo Express Pod -> Mongodb Internal Service -> Mongodb Pod
