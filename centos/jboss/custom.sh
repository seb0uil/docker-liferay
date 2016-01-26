#!/bin/sh
echo 'Cleaning jboss Liferay'

jbosshome=/opt/liferay/current/jboss-7.1.1/
module=${jbosshome}/modules/com/liferay/portal/main/
deployement=${jbosshome}/standalone/deployments/
ROOT=${deployement}/ROOT.war/WEB-INF/

\rm -rf ${jbosshome}/standalone/configuration/standalone_xml_history/

for i in `ls $module/*.jar`;
  ## cf. http://www.linuxquestions.org/questions/linux-general-1/ls-do-not-list-full-path-only-filename-657894/
  do result=`grep ${i##/*/} $module/module.xml`;
    if [ -z "$result" ];
        then
        sed -i "s/<resources>/<resources>\n\t\t<resource-root path=\"${i##/*/}\"\/>/g" $module/module.xml
        fi;
  done

for i in `grep -Po '"(.*?jar)' $module/module.xml | sed 's/"//g'`; 
  do 
    if [ ! -f $module/$i ]
      then sed -i "/^.*$i.*$/d" $module/module.xml 
    fi
  done

\rm -rf ${deployement}/*.war.*
for i in `ls -d ${deployement}/*.war`;
  do touch $i.dodeploy;
  done

\rm -rf ${jbosshome}/standalone/tmp

