# Docker image for liferay

The image is build in docker registry : https://registry.hub.docker.com/u/seb0uil/liferay/
you can pull it :
```
docker pull seb0uil/liferay:centos-jboss
docker pull seb0uil/liferay:ubuntu-tomcat
```

## Start me up
To start the container, simplu run
```
docker run -- rm -it -p 8080:8080 seb0uil/liferay:ubuntu-tomcat
```
