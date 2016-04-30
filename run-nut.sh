#!/bin/sh
open -a XQuartz
xhost + # TODO limit to just the host
# bridge100 is disappearing after a reboot
ip=`ifconfig bridge100 | grep inet | awk '$1=="inet" {print $2}'`
docker run --rm -it \
    -e DISPLAY=$ip:0 \
    --security-opt seccomp=unconfined \
    -v $HOME/go/nut:/home/vscode/nut \
    ctaggart/golang-vscode \
    su - vscode -c "cd ~/nut; ./vscode.sh"
