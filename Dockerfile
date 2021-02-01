FROM nvcr.io/nvidia/l4t-ml:r32.5.0-py3

ENV SCRATCH /tmp/scratch
ENV USER root
ENV HOME /$USER
ENV VIM_DIR=$HOME/.vim
ENV VIMRC $HOME/.vimrc

RUN apt update

RUN apt install -y \
            build-essential \
            curl \
            git \
            locales \
            python3-pip \
            silversearcher-ag \
            tmux \
            vim \
            zsh

RUN locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8

RUN chsh -s /bin/zsh

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
        ~/.fzf/install

RUN git clone https://github.com/k-takata/minpac.git $VIM_DIR/pack/minpac

COPY .vimrc $VIMRC

COPY ./scriptin.vim ${SCRATCH}/scriptin.vim
RUN cat $SCRATCH/scriptin.vim
#RUN nvim -s - < scriptin.vim

RUN python3 -m pip install bentoml
