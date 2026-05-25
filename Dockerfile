# general, interactive Ubuntu 26.04 environment

FROM m.daocloud.io/docker.io/library/ubuntu:26.04

ARG USER_NAME=billd
ARG USER_FULLNAME="Bill Dong"

RUN apt-get update && \
    apt-get install -y unminimize && \
    yes | unminimize && \
    apt-get install -y \
        sudo bash-completion man-db less \
        vim cscope universal-ctags global id-utils vim-doc vim-scripts \
        info emacs-nox emacs-common-non-dfsg \
        git tree plocate \
        wget curl screen tmux && \
    groupmod -n ${USER_NAME} ubuntu && \
    usermod -l ${USER_NAME} -g ${USER_NAME} -c "${USER_FULLNAME}" -d "/home/${USER_NAME}" -m -s /bin/bash ubuntu && \
    usermod -aG sudo ${USER_NAME} && \
    echo "${USER_NAME} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
CMD ["/bin/bash"]

RUN touch .sudo_as_admin_successful

LABEL description="General, interactive Ubuntu 26.04 environment for billd"
