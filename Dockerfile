
# 001 - class1 (image name)
# FROM ubuntu
# CMD ["sleep", "300"]


# 002 - sabbir-bs/ngnix
FROM nginx
CMD ["nginx", "-g", "daemon off;"]

# 003 sabbir-bs/ubuntu-nxinx
FROM ubuntu
RUN apt update
RUN apt install nginx -y
COPY . /var/www/html/
# CMD ["sleep", "300"] for debugging purpose
CMD ["nginx", "-g", "daemon off;"]
