# Learning Devops

Learning Devops is super fun and interesting to me. This is a repository which contains my notes and study materials
in the journey to be a Devops.

## index

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

```sh
ifconfig
```

- Clinet URL or cURL is a command-line tool for getting or sending data including files using URL syntax.

```sh
curl http://localhost:8090/ or curl www.google.com
```
