#!/bin/bash 

RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${RED}docker BIND MOUNT! ${NC}"
echo "File system of host will be modified"
echo "docker run -it --mount type=bind,src=$HOME/study/LinuxSetup/config/,target=/root/ configtest"
docker run -it --mount type=bind,src=$HOME/study/LinuxSetup/config/,target=/test/ configtest
