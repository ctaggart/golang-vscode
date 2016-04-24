#!/bin/sh
open -a XQuartz
xhost + # TODO limit to just the host
# bridge100 is disappearing after a reboot
ip=`ifconfig bridge100 | grep inet | awk '$1=="inet" {print $2}'`
docker run --rm -it -w /root -e DISPLAY=$ip:0 -v $PWD:/home/vscode ctaggart/golang-vscode