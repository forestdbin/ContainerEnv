# Scratch

I want a general-purpose, interactive Ubuntu development container that feels like logging into my own Linux workstation rather than entering a minimal app runtime image. The container should start from a clean Ubuntu base, provide my preferred non-root user identity and home directory, allow passwordless administrative operations when needed, and include the classic command-line and editor tools I use for everyday development. The image is meant to be practical and personal: once I enter it, I should be able to work immediately in a familiar shell-oriented environment without extra setup. The scratch notes capture the manual exploration path of that environment.

**tldr;**

A reproducible Ubuntu-based personal development environment, optimized for interactive shell use, with my user account, my working directory, sudo access, and a curated set of traditional Linux development tools already installed.


## get base image
```bash
$ docker pull m.daocloud.io/docker.io/library/ubuntu:26.04

$ docker tag m.daocloud.io/docker.io/library/ubuntu:26.04 myfoo:26.04
$ docker tag m.daocloud.io/docker.io/library/ubuntu:26.04 myfoo:latest
```


## run a container
```bash
$ docker run \
    -it \
    --name myfoo \
    --rm \
    --hostname foo-host \
    -v myhome:/home/billd \
    myfoo
```


## add/modify a normal user
```bash
# groupadd -g 1000 billd
# useradd -m -u 1000 -g 1000 -s /bin/bash -c 'Bill Dong' billd

# groupmod -n billd ubuntu
# usermod -l billd -g billd -c 'Bill Dong' -d /home/billd -m -s /bin/bash ubuntu
```

```bash
$ docker commit \
    -a 'Bill Dong' \
    -m 'add user billd' \
    -c 'USER billd' \
    -c 'WORKDIR /home/billd' \
    -c 'CMD ["/bin/bash"]' \
    myfoo \
    myfoo
```


## sudo
```bash
$ docker exec -it -u 0 myfoo bash

# apt update
# apt install -y sudo
# usermod -aG sudo billd
# echo 'billd ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers
# update-alternatives --set sudo /usr/bin/sudo.ws
```

```bash
$ docker commit \
    -a 'Bill Dong' \
    -m 'enable sudo' \
    myfoo \
    myfoo
```


## install software
```bash
# apt install unminimize
# unminimize
# apt install bash-completion man-db less
# apt install vim cscope universal-ctags vim-doc vim-scripts
# apt install info emacs-nox emacs-common-non-dfsg
# apt install git tree plocate
# apt install wget curl screen tmux
```

```bash
$ docker commit \
    -a 'Bill Dong' \
    -m 'apt install' \
    myfoo \
    myfoo
```


## TODO

- [ ] 构建缓存
    - 最小可用的 apt-cacher-ng + Docker build 接入方式
    - 一个“除了 apt 以外也能缓存”的统一下载缓存设计草案
    - 有没有透明的方案呢？
