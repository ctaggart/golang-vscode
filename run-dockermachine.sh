#!/bin/sh
open -a XQuartz
xhost + $(docker-machine ip)
# virtual box network, parallels was vnic0
ip=`ifconfig vboxnet1 | grep inet | awk '$1=="inet" {print $2}'`
docker run --rm -it -w /root -e DISPLAY=$ip:0 -v $PWD:/home/vscode ctaggart/golang-vscode