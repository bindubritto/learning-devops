# Kubernetes Master - Worker Working flow

- First setup 2 ec2, one for master another for worker

- ssh, and installed docker to both of them.

- Restart docker and check status

```sh
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl restart docker
sudo systemctl enable docker
sudo systemctl status docker
```
