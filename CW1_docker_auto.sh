#!/bin/bash

# Master
cd
mkdir CW1_master
cd CW1_master
IPaddr=$(hostname -I | awk '{print $1}')
echo -e 'http{\n    upstream CW1_master {\n        server "$IPaddr":8081\n        server "$IPaddr":8082\n        server "$IPaddr":8083\n    }\n\n    server {\n        listen 8080;\n\n        location / {\n            proxy_pass http://CW1_master/;\n        }\n    }\n}\n\nevents { }' | sudo tee nginx.conf
echo '<html><body><h1> Welcome to COMP3004 CW1 Master Node </h1></body></html>' | sudo tee index.htm
echo -e 'FROM nginx:alpine \n COPY /index.htm /usr/share/nginx/html/index.html \n' | sudo tee Dockerfile
sudo docker build -t nginx_cw1_master .
sudo docker run -itd --name nginx_master -p 8080:80 nginx_cw1_master 

# Worker 1
cd
mkdir CW1_worker_1
cd CW1_worker_1
echo '<html><body><h1> Welcome to COMP3004 CW1 Worker 1 </h1></body></html>' | sudo tee index.htm
echo -e 'FROM nginx:alpine \n COPY /index.htm /usr/share/nginx/html/index.html \n' | sudo tee Dockerfile
sudo docker build -t nginx_cw1_worker_1 .
sudo docker run -itd --name worker_1 -p 8081:80 nginx_cw1_worker_1 

# Worker 2
cd
mkdir CW1_worker_2
cd CW1_worker_2
echo '<html><body><h1> Welcome to COMP3004 CW1 Worker 2 </h1></body></html>' | sudo tee index.htm
echo -e 'FROM nginx:alpine \n COPY /index.htm /usr/share/nginx/html/index.html \n' | sudo tee Dockerfile
sudo docker build -t nginx_cw1_worker_2 .
sudo docker run -itd --name worker_2 -p 8082:80 nginx_cw1_worker_2

# Worker 3
cd
mkdir CW1_worker_3
cd CW1_worker_3
echo '<html><body><h1> Welcome to COMP3004 CW1 Worker 3 </h1></body></html>' | sudo tee index.htm
echo -e 'FROM nginx:alpine \n COPY /index.htm /usr/share/nginx/html/index.html \n' | sudo tee Dockerfile
sudo docker build -t nginx_cw1_worker_3 .
sudo docker run -itd --name worker_3 -p 8083:80 nginx_cw1_worker_3 