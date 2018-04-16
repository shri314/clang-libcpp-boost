# docker environment for: `clang` + `libc++` + `boost`

[![CircleCI](https://circleci.com/gh/shri314/clang-libcpp-boost.svg?style=svg)](https://circleci.com/gh/shri314/clang-libcpp-boost)

## How to build the container:
### To build the docker images:

```
make build
make push
```

### To test the container run a sample built from c++ source code:

```
make sample-run
```

## How to use in another project:
#### 1. Create docker-compose.yml with a volume mount
```
version: '3.0'
services:
   clang-libcpp-boost-env:
      image: shri314/clang-libcpp-boost
      entrypoint: sleep infinity
      container_name: clang-libcpp-boost-env
      restart: always
      volumes:
         - .:/src
```

#### 2. Create a Makefile (or use your equivalent build tool if you have one)
```
DOCKER_ENV_CMD = docker exec -it clang-libcpp-boost-env

all: sample-run

up:
        docker-compose up -d

down:
        docker-compose down

sample: up sample.o
        $(DOCKER_ENV_CMD) clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -lc++abi -o sample sample.o

sample.o: up sample.cpp
        $(DOCKER_ENV_CMD) clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -c sample.cpp

sample-run: sample
        $(DOCKER_ENV_CMD) ./sample

clean:
        rm -f sample sample.o
```

#### 3. Put your sources in current directory (available as /src inside the container)
```
$ cat sample.cpp
#include <iostream>
#include <optional>
#include <string>
#include <experimental/coroutine>
#include <boost/lexical_cast.hpp>

int x = 0;

std::optional<int> foo() {
   return []() {
      return x++;
   }();
}

int main() {
   std::cout << "Hello " << *foo() << "\n";
   std::cerr << "Hello " << *foo() << "\n";
   std::clog << "Hello " << boost::lexical_cast<std::string>(*foo()) << "\n";
}
```

#### 4. Put your sources in current directory (available as /src inside the container) and build
```
make
```
