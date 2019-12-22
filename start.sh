docker build -t xf/ubuntu:18.04 .
docker run -d -p 8080:8080 xf/ubuntu:18.04

# 删除 docker rmi -f xf/ubuntu:18.04
# docker stop xf/ubuntu:18.04
