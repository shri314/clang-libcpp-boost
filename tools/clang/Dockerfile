FROM ubuntu:17.10

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y lsb-release curl

RUN curl -q http://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/artful/ llvm-toolchain-$(lsb_release -cs) main" >> /etc/apt/sources.list.d/llvm-repos.list

RUN apt-get update && \
    apt-get install -y \
      clang-7 \
      clang-7-doc \
      clang-format-7 \
      clang-tools-7 \
      libclang-7-dev \
      libclang-common-7-dev \
      libclang1-7 \
      libfuzzer-7-dev \
      libllvm7 \
      lld-7 \
      lldb-7 \
      llvm-7 \
      llvm-7-dev \
      llvm-7-doc \
      llvm-7-examples \
      llvm-7-runtime \
      python-clang-7

RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 1000
RUN update-alternatives --install /usr/bin/c++     c++     /usr/bin/clang++-7 1000
RUN update-alternatives --install /usr/bin/clang   clang   /usr/bin/clang-7   1000
RUN update-alternatives --install /usr/bin/cc      cc      /usr/bin/clang-7   1000
RUN update-alternatives --install /usr/bin/ld      ld      /usr/bin/ld.lld-7  1000

WORKDIR /src
