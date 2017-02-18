all: hello-c hello-cc hello-cc-static hello-c-static

hello-c: hello.c
	$(CC) -o $@ $^ -Ofast -flto

hello-cc: hello.cc
	$(CXX) -o $@ $^ -Ofast -flto

hello-c-static: hello.c
	$(CC) -o $@ $^ -static -Ofast -flto

hello-cc-static: hello.cc
	$(CXX) -o $@ $^ -static -Ofast -flto

hello-hs: hello.hs
	ghc -O $< -o $@

hello-rs: hello.rs
	rustc -C opt-level=3 $< -o $@

bench: hello-c hello-cc hello-cc-static hello-c-static
	./bench.sh

.PHONY: bench clean

clean:
	$(RM) hello-c hello-cc hello-cc-static hello-c-static
