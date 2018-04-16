FROM shri314/clang

RUN apt-get update && \
    apt-get install -y git cmake

WORKDIR /tmp

RUN cd /tmp \
      && git clone https://github.com/llvm-project/libcxx \
      && mkdir -p /tmp/libcxx/build

RUN cd /tmp \
      && git clone https://github.com/llvm-project/libcxxabi \
      && mkdir -p /tmp/libcxxabi/build

RUN cd /tmp/libcxx/build \
      && cmake \
         -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_CXX_COMPILER=clang++ \
         -DCMAKE_C_COMPILER=clang \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-7 \
         .. \
      && make install

RUN cd /tmp/libcxxabi/build \
      && cmake \
         -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_C_COMPILER=clang \
         -DCMAKE_CXX_COMPILER=clang++ \
         -DLIBCXXABI_LIBCXX_INCLUDES=../../libcxx/include \
         -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-7 \
         .. \
      && make install

RUN cd /tmp/libcxx/build \
      && cmake \
         -DCMAKE_BUILD_TYPE=Release \
         -DCMAKE_CXX_COMPILER=clang++ \
         -DCMAKE_C_COMPILER=clang \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DLIBCXX_CXX_ABI=libcxxabi \
         -DLIBCXX_CXX_ABI_INCLUDE_PATHS=../../libcxxabi/include \
         -DLLVM_CONFIG_PATH=/usr/bin/llvm-config-7 \
         .. \
      && make install

RUN rm -rf /tmp/libcxx /tmp/libcxxabi

WORKDIR /src
