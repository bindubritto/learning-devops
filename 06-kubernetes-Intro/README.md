# Kubernetes Introduction

We have 2 plane.
    - Control Plane
    - Data Plane

Let's say, we setup 3 server, 1 will be master, 2 will be worker node.

We will deploy container or application container in worker node. All data comes and go from there, that's why it is called data plane.

And control plane's master node will control those worker node. That's why it is called control plane. Master will always in odd number.

- Master Components

1. Api Server (default port 6443)

Api Server -- Master -- Devops

When devops will run any command like kubectl, then this command will go to api server of kubernetes

- Communication between Master & Worker

Worker will give update to his master by using kubelet. Every worker have some system name kubelet, by using this worker node always
give feedback or report to api server.

There is a database named etcd, which will save that report or current state in general.

Devops will give command to api server, api server will pass it to kubelet then kubelet will pass it to docker engine.
