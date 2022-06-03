# NGINX Load Balancing

- L2 bridge network range is like that 172.17.0.0/16

- What is tcpdump?

tcpdump is a data-network packet analyzer computer program that runs under a command line interface. It allows the user to display TCP/IP and other packets being transmitted or received over a network to which the computer is attached.

This website helps a lot to understand: [tcpdump-intro](https://opensource.com/article/18/10/introduction-tcpdump)

- Context says in which folder the dockerfile is staying.

- Docker compose file used for running multiple container and creating a bridge (L2) and attach them with that network.

When we inspect that bridge network, we'll able to see a whole different subnet and gateway. Which will use docker and it's container by default.

```py
[
    {
        "Name": "05-nginx-load-balancing_default",
        "Id": "e77ae4fdecdc699823ca62e6ae6c5bad6e8c1f6b43895658a980e7e59833121a",
        "Created": "2022-06-03T15:41:04.217124912Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "b4a125032a5f3a5036c6d356f14222c7d8f43aa4bf6cc2034a0e4d945d89a951": {
                "Name": "05-nginx-load-balancing_proxy_1",
                "EndpointID": "b1a5e12282bf34efca7881051be41c7c480c1c945db9cb70522c38f30a46028b",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "b751c604280b85b6236b3b8ef55175db87506472b08f2779e273dd3150bdf944": {
                "Name": "05-nginx-load-balancing_webapp_1",
                "EndpointID": "6f711eb20e53d26daf7a629af5916438fc00846a52f12714f5151131b936f853",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {
            "com.docker.compose.network": "default",
            "com.docker.compose.project": "05-nginx-load-balancing",
            "com.docker.compose.version": "2.5.1"
        }
    }
]
```

Jokhon amra docker compose file a 2 ta service launch korlam tokhon docker L2 ekta bridge create holo. Sei bridge er under a
service 2 ta k 2 ta alada IP diye bind korlo.
