# docker-kubernetes

This repository is not just an ordinary repository, it is like a journey to be better at technology, most specifically docker and kuberneter.
I will update here, what I've learnt so far


Class - 02


Some basic terminology


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

23.00

Layer3

Layer4

