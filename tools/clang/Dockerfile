FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install -y --no-install-recommends lsb-release curl
RUN apt-get install -y --no-install-recommends gnupg gnupg1 gnupg2
RUN apt-get install -y --no-install-recommends ca-certificates

#https://apt.llvm.org/

RUN curl -q https://apt.llvm.org/llvm-snapshot.gpg.key | tee | apt-key add -
RUN echo "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs) main"    >> /etc/apt/sources.list.d/llvm-repos.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      clang \
      clang-format \
      clang-tidy \
      clang-tools \
      clangd \
      lld \
      lldb \
      python-clang

WORKDIR /src
