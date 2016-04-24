#!/bin/sh
apt-get update \
&& apt-get install -y --no-install-recommends unzip \
  libgtk2.0-0 libgconf-2-4 libnss3 libasound2 libxtst6 \
&& curl -o vscode-amd64.deb -L https://go.microsoft.com/fwlink/?LinkID=760868 \
&& dpkg -i vscode-amd64.deb