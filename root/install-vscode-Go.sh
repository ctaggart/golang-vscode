#!/bin/sh
dir=$(cd `dirname "$0"` && pwd)
# publisher extension version
$dir/install-vscode-extension.sh lukehoban Go 0.6.38

echo "export PATH=/usr/local/go/bin:$PATH" >> $HOME/.bash_profile
echo "export GOPATH=$HOME/go" >> $HOME/.bash_profile
. $HOME/.bash_profile

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

# https://github.com/derekparker/delve/wiki/Building#linux
go get -v -u github.com/peterh/liner github.com/derekparker/delve/cmd/dlv