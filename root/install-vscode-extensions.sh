#!/bin/sh
dir=$(cd `dirname "$0"` && pwd)
# publisher extension version
$dir/install-vscode-extension.sh lukehoban Go 0.6.38
# $dir/install-vscode-extension.sh donjayamanne python 0.3.5
# $dir/install-vscode-extension.sh saviorisdead RustyCode 0.12.0
# $dir/install-vscode-extension.sh Ionide Ionide-fsharp 1.6.3