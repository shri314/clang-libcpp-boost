sample: sample.o
	docker exec -it dev-env clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -lc++abi -o sample sample.o

sample.o: sample.cpp
	docker exec -it dev-env clang++ -std=c++2a -fcoroutines-ts -stdlib=libc++ -lc++abi -c sample.cpp

run: sample
	docker exec -it dev-env ./sample

clean:
	rm -f sample sample.o

pre:
	docker-compose up --build -d
