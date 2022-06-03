FROM nginx

RUN apt update
RUN apt install -y dnsutils
RUN apt install -y net-tools
RUN apt install -y tcpdump
RUN apt install -y telnet

# WORKDIR /app

# COPY . .

COPY index.html /usr/share/nginx/html/index.html

CMD [ "nginx", "-g", "daemon off;" ]
