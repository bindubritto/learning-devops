# Learning Devops

Learning Devops is super fun and interesting to me. This is a repository which contains my notes and study materials
in the journey to be a Devops.

## Index

- [01-Introduction to Devops](https://github.com/bindubritto/learning-devops/tree/main/01-Introduction-to-Devops)
- [02-Building Docker Image](https://github.com/bindubritto/learning-devops/tree/main/02-Building-Docker-Image)
- [03-Docker Basics](https://github.com/bindubritto/learning-devops/tree/main/03-Docker-Basics)
- [04-Networking Between Container](https://github.com/bindubritto/learning-devops/tree/main/04-Networking-Between-Containers)

### All Command

- Build a docker image with a name tag where dockerfile is located on the same folder("." means location of dockerfile)

```sh
sudo docker build -t <image_name> .
```

- To run specific docker image

```sh
sudo docker run <image_name>
```

- List of all running docker container

```sh
sudo docker ps
```

```sh
sudo docker exec -it <container_id> sh
```

- To stop a particular docker container

```sh
sudo docker stop <container_id>
```

- To inspect a particular docker container

```sh
sudo docker inspect <container_id>
```

- Clinet URL or cURL is a command-line tool for getting or sending data including files using URL syntax.

```sh
curl http://localhost:8090/ or curl www.google.com
```

- To find container ID.

```sh
docker inspect <container_id or name> | grep IPAddress
```

- TCP Dump at en0 (mac)/ network-interface-name en0, docker0

```sh
sudo tcpdump -i en0
```

- To change permission

```sh
sudo chmod 400 <cert file/ pem file>
```

- To login server

```sh
ssh -i <cert or pem file> username@ip

exm: ssh -i xyz.cer ubuntu@65.0.173.64
```

- Install docker in linux server

```sh
sudo apt install docker.io
```

- Restart docker and check status

```sh
sudo systemctl restart docker
sudo systemctl status docker
```

- Install network inspect tools

```sh
sudo apt install net-tools

ifconfig
```

- IP Tables

```sh
sudo iptables -L
```

- To see docker network

```sh
sudo docker network ls

sudo docker network inspect <L2-bridge-name>
```
