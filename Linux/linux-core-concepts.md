uname

uname -r


system calls

open()
getpid()
close()
readdir()
strlen()
closedir()


display messages from kernel space

dmesg
dmesg | grep -i usb


For device info
udevadm info --query=path --name=/dev/sda5

udevadm monitor


To list all pci info
lspci


Storage
lsblk

sda is physical disk,
sda1-sda6 are partitions


CPU
lscpu
lsmem --summary
free -m or -k or -g


HARDWARE INFO
lshw


Linux Boot Sequence Overview

What INIT System used

ls -l /sbin/init



Systemd Target
Runlevels

runlevel

N 5 => Graphical Target
N 3 => Multi User Target


To see which targets

systemctl get-default

ls -ltr /etc/systemd/system/default.target

systemctl set-default multi-user.target



All external disks details
df -hP








