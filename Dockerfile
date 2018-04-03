FROM openshift/jenkins-2-centos7
MAINTAINER manoharendla277@gmail.com

COPY plugins.txt /opt/openshift/configuration/plugins.txt
RUN /usr/local/bin/install-plugins.sh /opt/openshift/configuration/plugins.txt


RUN mkdir -p "$JENKINS_HOME"/workspace/test1  
RUN mkdir -p "$JENKINS_HOME"/workspace/test2

# Create the jobs folder recursively  
RUN mkdir -p "$JENKINS_HOME"/jobs/test1  
RUN mkdir -p "$JENKINS_HOME"/jobs/test2

# Add the custom configs to the container  
COPY /configs/test1_config.xml "$JENKINS_HOME"/jobs/test1/config.xml  
COPY /configs/test2_config.xml "$JENKINS_HOME"/jobs/test2/config.xml

# Create build file structure  
RUN mkdir -p "$JENKINS_HOME"/jobs/test1/latest/  
RUN mkdir -p "$JENKINS_HOME"/jobs/test1/builds/1/

# Create build file structure  
RUN mkdir -p "$JENKINS_HOME"/jobs/test2/latest/  
RUN mkdir -p "$JENKINS_HOME"/jobs/test2/builds/1/
