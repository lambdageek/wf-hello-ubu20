#! /bin/sh

set -e
set -x

apt-get -yq install gnupg ca-certificates
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

#CHANNEL=preview
CHANNEL=stable
echo "deb https://download.mono-project.com/repo/ubuntu $CHANNEL-focal main" | tee /etc/apt/sources.list.d/mono-official-$CHANNEL.list

apt-get update
