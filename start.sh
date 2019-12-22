docker build -t xf/ubuntu:18.04 .
docker run --name="test" -d -p 8080:8080 xf/ubuntu:18.04

docker exec -it test /bin/bash
# docker rm $(docker ps -a -q)
# docker cp /Users/eva/Documents/repository/com/study/omg/1.0-SNAPSHOT/omg-1.0-SNAPSHOT.war test:/opt/soft/
# 删除 docker rmi -f xf/ubuntu:18.04
# docker stop xf/ubuntu:18.04
