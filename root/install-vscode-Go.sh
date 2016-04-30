#!/bin/sh
dir=$(cd `dirname "$0"` && pwd)
# publisher extension version
$dir/install-vscode-extension.sh lukehoban Go 0.6.38

# see https://github.com/ctaggart/golang-vscode/issues/8
#echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
#echo 'export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH' >> ~/.bash_profile
GOPATH=~/go
echo 'export PATH=~/go/bin:/usr/local/go/bin:$PATH' >> ~/.bash_profile
. ~/.bash_profile

# https://github.com/Microsoft/vscode-go#tools
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/lukehoban/go-outline
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/tpng/gopkgs
go get -u -v github.com/newhook/go-symbols
go get -u -v golang.org/x/tools/cmd/guru

# https://github.com/derekparker/delve/blob/master/Documentation/installation/linux/install.md
go get github.com/derekparker/delve/cmd/dlv