#!/bin/sh
# installs a Visual Studio Code extension by downloading and unzipping to $HOME/.vscode/extensions/
# requires curl and unzip
if [ "$#" -ne 3 ]; then
  echo "3 parameters required, but given $#"
  exit 1
fi
publisher=$1
extension=$2
version=$3
echo "downloading $publisher.$extension-$version.vsix"
statuscode=$(curl --write-out "%{http_code}" -o /tmp/$publisher.$extension-$version.vsix https://$publisher.gallery.vsassets.io/_apis/public/gallery/publisher/$publisher/extension/$extension/$version/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage)
echo "status code $statuscode"
if [ $statuscode -ne 200 ]; then
  exit 2
fi
rm -rf /tmp/extension/
unzip -q /tmp/$publisher.$extension-$version.vsix extension/* -d /tmp
rm /tmp/$publisher.$extension-$version.vsix
mkdir -p $HOME/.vscode/extensions/
rm -rf $HOME/.vscode/extensions/$publisher.$extension-$version/
mv /tmp/extension/ $HOME/.vscode/extensions/$publisher.$extension-$version/
echo "installed $HOME/.vscode/extensions/$publisher.$extension-$version"