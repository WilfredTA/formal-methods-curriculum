FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install --yes \
    wget vim

RUN wget -O kframework.deb https://github.com/kframework/k/releases/download/v5.2.65/kframework_5.2.65_amd64_bionic.deb
RUN apt install --yes ./kframework.deb
