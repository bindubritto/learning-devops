# docker-kubernetes

This repository is not just an ordinary repository, it is like a journey to be better at technology, most specifically docker and kuberneter.
I will update here, what I've learnt so far

## Class - 02

In Class-02 Some basic terminology

Network Interface: Jeikhan diye packet gulu asha jaowa kore. Internet theke first a interface a ashbe. Then

Packet ta kernel space a jabe. Sekhane onek gulu kaj hobe. Then user space a jabe. So, what is user space & kernel space??

What kernel do? In simple term, resource manager. Zoom, Mozilla eigula user space theke kernel k request kore, resource call kore.

Eita k syscall bole. So, user space a thaka ekta process, kernel space er kache resource er jonno request kore. And packet er jonno o request korte pare.

Why we need kernel in the first place? So, jodi amra software diye directly hardware access korte chaitam, then baje code or buggy code er jonno kernel panic kheye jeto.

But user space a kono s/w cholle & crash korleo kernel panic khaito na.

Interface hocce sei jinish jeikhane, packet gulu hardware theke kernel a ashe first time. NIC card ei kaj ta kore.

Layer2 - Data Link Layer - Mac Address niye kaj hoy. Switch, Wifi-Dongle etc. Router is hybrid device. Switch er moddhe DHCP server thake.

Swithc er sathe connected device gulu swithc k ekta IP er jonno request korbe. And switch gulu te ekta range thake. CIDR range. DHCP IP allocate korar

pore ekta table create kore, mac address table. (IP <=> MAC ) CAM table.

Gateway: Jeikhan diye packet bahirer internet a jay ba ashe. gateway er kaj hocche, packet k ber kore deya.

Firewall: Ekpashe danger zone, ekpashe DMZ. DMZ eer niche thake Router, then tar niche thake switch, then tar niche thake Fat Server.

Docker:

// Foyzul's explanation //

Contianer: Is nothing but a self contained process. Ekta particular process run korar jonno bare minimum ja ja lage, tai niye isolated ekta environment.

// LXC er upor base kore docker build kora.

Linux er kichu core api ache, like network namespace, kernel namespace. So, docker jokhon kaj kore, eisob namespace er function gulu k directly invoke
kore. So, linux kernel lagbei lagbe. Ei jonno windows a WSL2 (windows subsystem of linux) use kora hoy, docker install er jonno.

But why container? Answer is multiple nodejs version. Or multiple version problem. Namespace er concept k use kore docker build kora hoyeche.

Docker Daemon: Kinda running forloop. Kono kichu instruction dilei execute kore.

Docker-Image bananor jonno docker-file lage.
So, dockerfile build korle amra pai, docker image.

Docker-file -> Build -> Docker Image -> Run -> Docker Container.

Docker image ta actully ekta zip file.

Docker image gulu kothao rakhar jayga k docker hub bole.

Layer3

Layer4

## Docker Terminology

- So, we need a package what will run in server. So, in terms of docker, ei package k bole docker image.

- docker image bananor jonno lage docker file. Docker file k build korle amra pabo docker image.

- docker image k run korlei pabo docker container.

- ei docker image k rakhar jayga hosse docker hub.

- ECR (Elastic Container Registry), GCR (Google Container Registry), ACR(Azure Container Registry)

- Ekta dockerfile diye ekta single process run hoy sudhu. More than 1 process, run hobe na.

## How to write dockerfile

- At fitst we need base image
- sudo docker build -t class1 .
- sudo docker run class1
- sudo docker ps
- sudo docker exec -it <container_id> sh

## 2nd assignment

Why /usr/share/nginx/html directory is not serving as default in nginx?

Both directories exist because both are needed, for different purposes.

/usr/share/nginx/html

is the compiled-in default location for each server's document root, in the absence of one being specified.

/var/www/html

is the configured location for the default server's document root as configured in /etc/nginx/sites-available/default

Why use /var/www/html? Because a sysadmin may wish to modify the default vhost's document root, but the Filesystem Hierarchy Standard (which Ubuntu follows because it follows Debian, whose policy requires compliance with the FHS) requires that user-modifiable content go into /var (or /srv, or /home -- basically any number of places that aren't /usr).

## docker command

sudo docker build -t sabbir-bs/nginx .
sudo docker run -p 8080:80 sabbir-bs/nginx

Now, we want to serve out static html file.

Ekta copy command er 2 ta part.

COPY Source Destination

## class - 04

Server a packet dhuktese interface diye, eth0 te. ethernet interface. eth0 is an interface. Aita first a kernel namespace a dhuklo.

Packet a thake onek kichu. Source IP, Destination IP, Source Port, Destination Port, Payload, etc.

So, kono ekta packet jodi 8080 as it's destination port niye ashe, tar mane ekta packet er destination port holo 8080.

And amra amader IP table er Port Forwarding rule ta eivabe bole diyechi j, jodi keu 8080 port a ashte chay, tahole se jeno

172.13.0.3:80 port a jay. Eita amar port forwarding rule hisebe bola ache. So, L2 bridge er network range holo 172.13.0.0/16

Jokhoni amra kono container k emon port forwading rule dibo, se layer-2 bridge er pechone create hobe.

World er shob network interface er e mac address thake.

We'll create 2 microservice.

-- Internal Service - bahirer world a expose korbo na.

-- External Service - Jeita port diye expose korbo, 8081 port.

-- So design ta hobe most likely emon.

1. Bahirer world er user ekta request korbe 8081 a. Ei request ta first a ashbe L2 bridge a. Then seita jabe, external service a,
then sei external service abar call dibe internal service k, through L2 bridge. Then internal service response back korbe, And sei response
abar external service bahirer world a back korbe.

-- External as N2, Internal as N1

-- World -> 8081 port -> N2 -> N1 -> reponse back to N2 -> Then back to outer world.
