FROM debian:jessie-slim

MAINTAINER Tim Schruben <tim.schruben@gmail.com>

ENV HOME /home/dev

RUN adduser --system --shell /bin/bash dev

RUN apt-get update && \
    apt-get install -y \
                    vim \
                    git \
                    tree \
                    curl \
                    wget \
                    man \
                    less \
                    ctags \
                    libevent-dev \
                    gcc \
                    ncurses-dev \
                    make \
                    automake \
                    pkg-config && \
    apt-get clean

RUN git clone --depth 1 https://github.com/tmux/tmux.git && \
    cd tmux && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

ADD dotfiles/ $HOME
ADD vimrc $HOME/.vimrc

RUN mkdir -p $HOME/.tmux/plugins && \
    cd $HOME/.tmux/plugins && \
    git clone --depth 1 --recursive https://github.com/tmux-plugins/tmux-continuum.git && \
    git clone --depth 1 https://github.com/tmux-plugins/tmux-resurrect.git && \
    git clone --depth 1 https://github.com/tmux-plugins/tpm.git

RUN mkdir -p $HOME/.vim/bundle && \
    cd $HOME/.vim/bundle && \
    git clone --depth 1 --recursive https://github.com/scrooloose/nerdtree.git && \
    git clone --depth 1 --recursive https://github.com/vim-syntastic/syntastic.git && \
    git clone --depth 1 --recursive https://github.com/tpope/vim-sensible.git && \
    git clone --depth 1 --recursive https://github.com/sheerun/vim-polyglot.git && \
    git clone --depth 1 --recursive https://github.com/tpope/vim-obsession.git

RUN apt-get install sudo && apt-get clean
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers
RUN adduser dev sudo && adduser dev adm

ENV LC_ALL C.UTF-8
ENV LANG $LC_ALL
ENV LANGUAGE $LC_ALL  
#RUN dpkg-reconfigure locales

USER dev
