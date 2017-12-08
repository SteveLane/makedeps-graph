# Makefile for makedeps-graph
# This Makefile creates a docker container for creating dependency graphs from
# Makefiles. As a side-effect, it creates the dependency graph for this
# Makefile; as such, this Makefile is larger than it needs to be!

.PHONY: all build-container png clean

all: build-container png

build-container: test-output.txt

png: img/deps.png

test-output.txt: Dockerfile
	docker build -t makedeps-graph . \
	&& touch test-output.txt

img/deps.png: test-output.txt
	mkdir -p img \
	&& docker run -v $$(pwd):/tmp/graph makedeps-graph \
	&& mv deps.* img/

clean:
	rm -rf img/ \
	&& rm test-output.txt
