FROM ubuntu:17.10

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y lsb-release curl

RUN curl -q http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/artful/ llvm-toolchain-$(lsb_release -cs) main" >> /etc/apt/sources.list.d/llvm-repos.list

RUN apt-get update && \
    apt-get install -y \
      clang-8 \
      clang-8-doc \
      clang-format-8 \
      clang-tools-8 \
      libclang-8-dev \
      libclang-common-8-dev \
      libclang1-8 \
      libfuzzer-8-dev \
      libllvm8 \
      lld-8 \
      lldb-8 \
      llvm-8 \
      llvm-8-dev \
      llvm-8-doc \
      llvm-8-examples \
      llvm-8-runtime \
      python-clang-8

RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-8 1000
RUN update-alternatives --install /usr/bin/c++     c++     /usr/bin/clang++-8 1000
RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-8   1000
RUN update-alternatives --install /usr/bin/cc      cc      /usr/bin/clang-8   1000
RUN update-alternatives --install /usr/bin/ld      ld      /usr/bin/ld.lld-8  1000

WORKDIR /src
