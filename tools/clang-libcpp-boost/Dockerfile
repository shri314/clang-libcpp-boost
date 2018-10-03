FROM shri314/clang-libcpp

RUN apt-get update \
      && apt-get install -y python-dev

RUN cd /tmp \
      && mkdir -p /tmp/boost \
      && curl -s -L https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2 | tar -xjf - -C boost --strip-components 1

COPY b.patch /tmp/boost/

RUN cd /tmp/boost \
      && patch -p0 < b.patch \
      && ./bootstrap.sh --with-toolset=clang --prefix=/usr/ \
      && ./b2 toolset=clang cxxflags="-stdlib=libc++" linkflags="-stdlib=libc++" stage \
      && ./b2 toolset=clang cxxflags="-stdlib=libc++" linkflags="-stdlib=libc++" install

RUN rm -rf /tmp/boost

WORKDIR /src
