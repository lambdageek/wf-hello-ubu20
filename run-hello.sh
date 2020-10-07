#! /bin/sh

set -e
set -x

Xvfb :1 &

export DISPLAY=:1

mono hello.exe
