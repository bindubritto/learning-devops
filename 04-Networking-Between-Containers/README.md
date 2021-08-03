# Container-To-Container Communication

```sh
    cd internal
    npm init
    npm install axios
    npm install express
```

```sh
    cd ..
    cd external
    npm init
    npm install axios
    npm install express
```

```sh
    docker build -t internal .
```

```sh
    docker build run -p 8090:8080 internal
```

```sh
curl http://localhost:8090/
```

```sh
sudo docker stop <container_id>
```

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

-- World -> 8081 port -> External -> Internal -> reponse back to External -> Then back to outer world.
