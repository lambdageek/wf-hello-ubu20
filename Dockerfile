FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

COPY install-mono-server.sh /

RUN chmod a+x /install-mono-server.sh

RUN apt-get update

RUN /install-mono-server.sh

RUN apt-get -yq install libgtk2.0-0 mono-complete mono-devel xvfb vim-tiny

WORKDIR /root/wf

COPY Program.cs /root/wf
COPY run-hello.sh /root/wf
RUN chmod a+x /root/wf/run-hello.sh

RUN csc -out:hello.exe Program.cs -r:System.Windows.Forms.dll -r:System.Drawing.dll


CMD /root/wf/run-hello.sh



