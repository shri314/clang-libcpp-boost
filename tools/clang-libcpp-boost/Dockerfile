FROM shri314/clang-libcpp

RUN apt-get update \
      && apt-get install -y python-dev

RUN cd /tmp \
      && mkdir -p /tmp/boost \
      && curl -s -L https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.bz2 | tar -xjf - -C boost --strip-components 1

RUN cd /tmp/boost \
      && ./bootstrap.sh --with-toolset=clang --prefix=/usr/

RUN cd /tmp/boost \
      && ./b2 toolset=clang stage \
      && ./b2 toolset=clang install

RUN rm -rf /tmp/boost

# Additional libs
RUN apt-get install -y libssl-dev

WORKDIR /src
