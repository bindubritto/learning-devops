# 2nd assignment

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

## Docker Terminology

- So, we need a package what will run in server. So, in terms of docker, ei package k bole docker image.

- docker image bananor jonno lage docker file. Docker file k build korle amra pabo docker image.

- docker image k run korlei pabo docker container.

- ei docker image k rakhar jayga hosse docker hub.

- ECR (Elastic Container Registry), GCR (Google Container Registry), ACR(Azure Container Registry)

- Ekta dockerfile diye ekta single process run hoy sudhu. More than 1 process, run hobe na.
