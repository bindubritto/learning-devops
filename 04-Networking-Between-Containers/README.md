# Container-To-Container Communication

Here are 2 simple services written in nodejs. One is external service, which port is open to outer world and another service's port is not exposed to outer world named internal services. Here I tried to communicate between those containers and tried to understand docker networking more deeply. That's my final goal. Understanding the main concept. This codebase may help or not, but surely I learned a lot from this simple 'Hello World" project.

```sh
    cd internal
    npm init
    npm install axios
    npm install express
```

```sh
    docker build -t internal .
```

```sh
    cd ..
    cd external
    npm init
    npm install axios
    npm install express
```

```sh
    docker build -t external .
```

```sh
    docker run internal
```

```sh
    cd ..
    cd external
    docker run -p 8090:8081 external
```

```sh
curl http://localhost:8090/
```

```sh
sudo docker stop <container_id>
```

## Project Learning

In our machine packet comes through interface, eth0 or en0(in mac). eth0 is an interface. At first packet comes to kernel namespace. And at the same time every packet have some many information to break down like

- Source IP
- Destination IP
- Source Port
- Destination Port
- Payload, etc.

In kernel namespace there is a cool guy named IP table, and there have some rules of port forwarding rules. So, if any packet comes with destination port 8090 then our IP table checks it and forward this traffic to 172.13.0.3:80 (external service). Why this type of IP? Cause when we define this port forwarding rule, docker container will create under the L2 bridge network and CIDR of L2 bridge is 172.13.0.0/16

- 172.13.0.1 for bridge itself
- 172.13.0.2 for internal service
- 172.13.0.3 for external service

As we haven't expose port for our internal service, so external service will communicate with internal service by that container IP address. So, this is happening here.

So far we have building a simple container to container communication system like this.

- Request comes from outer World to 8090 port
- IP table forward this traffic to 8081 port(external service)
- External service had dependencies on internal service, they communicate using container IP
- Internal service reponse back to external service
- Then external service will back response to outer world.
