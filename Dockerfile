# DOCKER-VERSION	1.6.2

FROM nhoag/vim
MAINTAINER Nathaniel Hoag, info@nathanielhoag.com

RUN apt-get update && \
  apt-get install -y zsh && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 --recursive https://github.com/sorin-ionescu/prezto.git /root/.zprezto

RUN sed -i 's/nano/vi/g' /root/.zprezto/runcoms/zprofile

RUN chsh -s /bin/zsh && \
  for rc in /root/.zprezto/runcoms/z* ; do ln -s "${rc}" "/root/.$(basename $rc)" ; done && \
  exec zsh && setopt EXTENDED_GLOB

ADD zshrc /root/.zshrc
