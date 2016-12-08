FROM centos:centos7

MAINTAINER Tim Schruben <tim.schruben@gmail.com>

ENV USER dev
ENV HOME /home/$USER

RUN adduser $USER
RUN echo "$USER  ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

RUN yum install -y epel-release \
                    vim \
                    git \
                    tree \
                    curl \
                    wget \
                    man \
                    less \
                    sudo \
                    ctags \
                    libevent-devel \
                    gcc \
                    ncurses-devel \
                    make

ADD https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz tmux.tar.gz
RUN tar xvzf tmux.tar.gz && \
    cd ./tmux-2.3 && \
    ./configure && \
    make && \
    make install && \
    cd ../ && \
    rm -rf ./tmux-2.3

USER $USER
ADD dotfiles/ $HOME


