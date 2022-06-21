# AWS Basics

- VPC Creation (A virtual router will create eventually)
- Attach IGW to that VPC
- Create Subnet (This network will smaller than VPC, obvious reason)
- Deploy EC2 under a subnet
- Define Security group (which will attached to switch)
- Route Table will associate with switch (subnet acctually) and default gateway is 10.10.0.0/16 (which is local in our example)

If server is not responding or unreachable, then packet is not sending.
If server have a timeout, then packet is not coming from that server.
