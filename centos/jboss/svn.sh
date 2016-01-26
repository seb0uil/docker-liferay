#!/bin/bash
set -e
#set -x

export LC_CTYPE=en_US.UTF-8

if [ ! -z ${SVN_USER} ] && [ ! -z ${SVN_PASS} ] && [ ! -z ${REPO_URL} ] && [ ! -z ${REPO_PATH} ] && [ ! -f /opt/liferay/current/done ] ;
then 
  svn --username ${SVN_USER} --password ${SVN_PASS} --no-auth-cache checkout ${REPO_URL}/${REPO_PATH} /tmp/${REPO_PATH} <<EOF 
t
EOF

listVar="ext portlets hooks themes layouttpl webs"
for i in $listVar; do
  echo "$i"
  for j in `ls -d /tmp/${REPO_PATH}/${i}/*/`; do
    if [ -f "${j}/build.xml" ];
    then
      cd ${j}
      ant clean compile direct-deploy
    fi
  done
done

\rm -rf /tmp/${REPO_PATH}

touch /opt/liferay/current/done ## setting this file will bypass checkout and compile next time
fi

#running jboss
/opt/liferay/current/jboss-7.1.1/bin/standalone.sh 
