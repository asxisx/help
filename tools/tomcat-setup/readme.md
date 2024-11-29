# Tomcat is easy to setup and test your apps.

Initial Setup works like this in Linux machine:

## Tomcat Installation

1. Make sure $JAVA_HOME environment variable is redirecting correctly. If not, do this: `export JAVA_HOME=/usr/lib/jvm/java-11`
2. [Download Tomcat9](https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.zip)
3. Unzip it: `unzip apache-tomcat-9.0.97.zip`
4. Give execute permission to `catalina.sh`
5. Run `catalina.sh start/run/stop`

## Manager App Access

1. Go to `conf` folder inside tomcat and edit the file `tomcat-users.xml`
2. Add this there:
```Bash
<role rolename="admin"/>
<user username="admin" password="password" roles="standard,manager,admin,manager-gui,manager-script,manager-jmx,manager-status"/>
```
