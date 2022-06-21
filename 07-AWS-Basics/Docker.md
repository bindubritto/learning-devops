# Docker Core

Docker actually create namespace. So, what is namespace?

- Namespace holo linux kernel er default ekta api, jar kaj hocce world ta k segregate kora.

- Kernel Space?

- OS related ja kichu chole shob kernel space a.

- User Space? - application, container eisob chole

- File, Process, Network

netstat -nr (route table for mac)

arp -a (Mac address table)

6 type er namespacee create kora jay. And era ekjon onnotar info janena. Almost 100% disconnected thake. And nijer process kei root proccess (init) mone kore

Amra namespace er ei character er upore base korei docker container banabo.

sudo ip netns add red (red name er ekta network namespace create hobe)

sudo ip netns list

sudo ip netns add green

sudo ip netns list

sudo ip netns exec red sh

ip link

ei command dile interface dekha jay.

host namespace a interface ache 2 ta, ekta eth0, ekta l0 but amar create kora network namespace a network ache ekta, only loopback.

Loopback diye packet dhulke, oi loopback diyei ber hobe. Loopback to loopback.

Eibar patch cable diye connect kore dibo and namespace gulur ekta ip dibo. Then ekta theke onnota ping korbo.

sudo ip link add veth-red type veth peer name veth-green

patch cable create hoilo, now cable er 2 ta socket namespace a set korte hobe.

sudo ip link set veth-red netns red

Ei command diye veth-red interface k red namespace a push korlam. Ekhon red a exec kore ip link dile 2 ta interface show korbe.

Same vabe veth-green k green namespace a push korbo.

Now, It's time to set IP.

First a veth-red a. Exec korbo, IP set korbo, then up korbo.

sudo ip netns exec red sh

ip addr add 10.1.1.1/24 dev veth-red

ip link set dev veth-red up

Secondly a veth-green a. Exec korbo, IP set korbo, then up korbo.

sudo ip netns exec green sh

ip addr add 172.31.6.60/24 dev veth-green

ip link set dev veth-green up
