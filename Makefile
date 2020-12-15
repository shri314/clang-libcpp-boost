###########################################################

build:
	docker-compose build

push:
	docker push shri314/clang:latest
	docker push shri314/clang-libcpp:latest
	docker push shri314/clang-libcpp-boost:latest

###########################################################

DOCKER_ENV_CMD = docker exec -it clang-libcpp-boost-env

up:
	CURRENT_UID="$$(id -u):$$(id -g)" docker-compose up -d
	@if [ "$$CIRCLECI" ]; \
	then \
	   echo "Workaround for CIRCLE CI as docker-compose mounts are unavailable"; \
	   docker cp ./sample.cpp clang-libcpp-boost-env:/src; \
	fi

down:
	docker-compose down

sample: up sample.o
	#https://libcxx.llvm.org/docs/UsingLibcxx.html
	$(DOCKER_ENV_CMD) clang++ -std=c++20 -fcoroutines-ts -stdlib=libc++ -L/usr/lib/llvm-10/lib -lc++abi -o sample sample.o

sample.o: up sample.cpp
	#https://libcxx.llvm.org/docs/UsingLibcxx.html
	$(DOCKER_ENV_CMD) clang++ -std=c++20 -fcoroutines-ts -nostdinc++ -I/usr/lib/llvm-10/include/c++/v1 -c sample.cpp

sample-run: sample
	$(DOCKER_ENV_CMD) ./sample

clean:
	rm -f sample sample.o

###########################################################
