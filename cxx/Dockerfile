# C++ environment

FROM x-dev:1

USER root

RUN apt-get install -y \
    build-essential clang \
    clang-format clang-tidy clang-tools \
    flex bison \
    cpp-doc gcc-doc make-doc \
    pkg-config \
    cmake cmake-curses-gui cmake-format ninja-build cmake-doc \
    autoconf automake libtool \
    gdb gdb-doc gdbserver \
    gcovr lcov valgrind \
    indent astyle && \
    wget -q -O /usr/local/bin/bazelisk https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 && \
    chmod +x /usr/local/bin/bazelisk && \
    wget -q -O /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/9.1.0/bazel-9.1.0-linux-x86_64 && \
    chmod +x /usr/local/bin/bazel

USER billd

LABEL description="C++ environment for billd"
