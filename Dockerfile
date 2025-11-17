# general, interactive Ubuntu 24.04 environment

FROM m.daocloud.io/docker.io/library/ubuntu:24.04

RUN yes | unminimize && apt-get update

RUN apt-get install -y sudo bash-completion man-db less && \
    apt-get install -y vim cscope universal-ctags global id-utils vim-doc vim-scripts && \
    apt-get install -y info emacs-nox emacs-common-non-dfsg && \
    apt-get install -y git tree plocate && \
    apt-get install -y wget curl screen tmux

RUN usermod -l billd -c "Bill Dong" -d /home/billd -m ubuntu && \
    groupmod -n billd ubuntu && \
    echo "billd ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER billd

WORKDIR /home/billd

RUN touch .sudo_as_admin_successful

LABEL description="General, interactive Ubuntu 24.04 environment for billd"
