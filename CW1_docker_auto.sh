#!/bin/bash
mkdir CW1_webtest
cd CW1_webtest
echo '<html><body><h1> Welcome to COMP3004 CW1 </h1></body></html>' | sudo tee index.htm
echo -e 'FROM nginx:alpine \n COPY /index.htm /usr/share/nginx/html/index.html \n' | sudo tee Dockerfile
sudo docker build -t nginxcw1_test1 .
sudo docker run -itd --name nginxserver1 -p 8081:80 nginxcw1_test1 