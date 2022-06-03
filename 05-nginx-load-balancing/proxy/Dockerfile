FROM nginx

RUN apt update
RUN apt install -y tcpdump
RUN apt install -y telnet
RUN apt install -y dnsutils
RUN apt install -y net-tools

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/

# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]
