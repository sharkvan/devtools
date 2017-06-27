FROM alpine:latest

MAINTAINER Tim Schruben <tim.schruben@gmail.com>

ENV HOME /home/root
ENV LC_ALL en_US.utf-8
ENV LANG $LC_ALL

RUN apk add --no-cache \
                    vim \
                    git \
                    tree \
                    curl \
                    wget \
                    man \
                    less \
                    sudo \
                    ctags \
                    libevent-dev \
                    gcc \
                    ncurses-dev \
                    make \
                    g++ \
                    tmux

ADD dotfiles/ $HOME
ADD vimrc $HOME/.vimrc

RUN mkdir -p $HOME/.tmux/plugins && \
    cd $HOME/.tmux/plugins && \
    git clone --depth 1 --recursive https://github.com/tmux-plugins/tmux-continuum.git && \
    git clone --depth 1 https://github.com/tmux-plugins/tmux-resurrect.git && \
    git clone --depth 1 https://github.com/tmux-plugins/tpm.git && \
    git clone --depth 1 --recursive https://github.com/tpope/vim-obsession.git

RUN mkdir -p $HOME/.vim/bundle && \
    cd $HOME/.vim/bundle && \
    git clone --depth 1 --recursive https://github.com/scrooloose/nerdtree.git && \
    git clone --depth 1 --recursive https://github.com/vim-syntastic/syntastic.git && \
    git clone --depth 1 --recursive https://github.com/tpope/vim-sensible.git && \
    git clone --depth 1 --recursive https://github.com/sheerun/vim-polyglot.git

