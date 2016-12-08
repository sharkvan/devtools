FROM centos:centos7

MAINTAINER Tim Schruben <tim.schruben@gmail.com>

ENV USER dev
ENV HOME /home/$USER

RUN adduser $USER
RUN echo "$USER  ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

RUN yum install -y epel-release \
                    tmux \
                    vim \
                    git \
                    tree \
                    curl \
                    wget \
                    man \
                    less \
                    sudo \
                    ctags

USER $USER
ADD dotfiles/ $HOME


