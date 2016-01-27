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

## Develop with it
During startup, it's easy to build liferay plugin from sdk.
just pass some variable :
 - SVN_USER
 - SVN_PASS
 - REPO_URL
 - REPO_PATH
With this value, a fresh checkout is done then it build 'ext portlets hooks themes layouttpl webs' directories
and deploy it to application server you choose.
