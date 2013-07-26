# Docker Asgard

Run [netflixOSS Asgard project](https://github.com/Netflix/asgard) in a [docker](http://docker.io) container.

# Build

`docker build -t username/asgard github.com/paulczar/docker-asgard`

see the Dockerfile to change from stable build to last successful build.

see the Dockerfile / Config.groovy to hard code your AWS credentials into the container.

# Amazon Setup

see [Asgard - Quick Start Guide](https://github.com/Netflix/asgard/wiki/Quick-Start-Guide) for information about getting your amazon credentials and setting up SQS/SimpleDB.

# Run

## Start Asgard - Default credentials 
_or hard coded from Dockerfile_

`docker run -d paulczar/asgard`

## Start Docker - Forward the port
_you probably don't want to do this,  not very secure_

```
ASGARD=$(docker run -d -p 8080 paulczar/asgard)
docker port $ASGARD 8080
```

## Start Docker - pass AWS credentials via environment variables

```
ASGARD=$(docker run -e ACCOUNTID=XXXXX -e ACCESSID=xxxxxx  -e SECRETKEY=xxxxxxx -d paulczar/asgard /opt/asgard/start)
ASGARD_IP=$(docker inspect $ASGARD | grep IPAd | awk -F'"' '{print $4}')
echo http://$ASGARD_IP:8080
```

## Access Asgard

open Chrome or Safari and point to either localhost with the forwarded port,  or run `docker inspect <DockerID> | grep -i IPA`  to get the IP address of the container if running locally

The initial startup time of the web app is real slow ( could just be my laptop though ...  my kingdom for a Dell Sputnik 2 ) ... be prepared to sit on the loading screen for a good few minutes.

you can view the status of loading at http://XXXXXXXX:8080/cache/list

# Copyright

Copyright [2013] [Paul Czarkowski]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# Author

Paul Czarkowski ( paul at paulcz dot net )
