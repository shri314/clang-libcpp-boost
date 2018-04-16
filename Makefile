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
	docker-compose up -d

sample: up sample.o
	$(DOCKER_ENV_CMD) clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -lc++abi -o sample sample.o

sample.o: up sample.cpp
	$(DOCKER_ENV_CMD) clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -c sample.cpp

sample-run: sample
	$(DOCKER_ENV_CMD) ./sample

clean:
	rm -f sample sample.o

###########################################################
