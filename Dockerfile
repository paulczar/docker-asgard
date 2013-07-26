# Asgard Container
#
# Author: Paul Czarkowski
# Date: 07/12/2013


FROM paulczar/jre7
MAINTAINER Paul Czarkowski "paul@paulcz.net"

# unstable build :-
ADD https://netflixoss.ci.cloudbees.com/job/asgard-master/lastSuccessfulBuild/artifact/asgard-standalone.jar /opt/asgard/asgard-standalone.jar

# stable build :-
#ADD https://netflixoss.ci.cloudbees.com/job/asgard-master/lastStableBuild/artifact/asgard-standalone.jar /opt/asgard/asgard-standalone.jar

# Uncomment below line if you want to hard code your EC2 credentials.
# And edit the file before running ... obviously.
#ADD Config.groovy /root/.asgard/Config.groovy

# script for starting with AWS creds from environment variables
ADD start /opt/asgard/start

# Start asgard
CMD ["java", "-Xmx1024M", "-XX:MaxPermSize=128m", "-jar", "/opt/asgard/asgard-standalone.jar"]

