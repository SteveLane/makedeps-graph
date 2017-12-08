# Make dependencies graph

This repository contains a (most likely bloated) dockerfile and script to create a dependency graph for a Makefile. It uses [https://github.com/lindenb/makefile2graph](https://github.com/lindenb/makefile2graph) to create a `.dot` and `.png` of the dependency graph.

## Why use docker?

I'm using docker so that I don't have to stuff around having dependencies on my main machine for something that I may only use rarely. It also means that creating the dependency graph will be portable.

## How to use

Firstly, make sure you have docker installed ([https://www.docker.com/community-edition](https://www.docker.com/community-edition)). You can then either pull down the image from [dockerhub](https://hub.docker.com/r/stevelane/makedeps-graph/):

```sh
$ docker pull stevelane/makedeps-graph
```

or you can use the `Makefile` in this repository to build the container yourself:

```sh
$ make
```

As a nice side-effect of using `make` to build the container, you'll get a dependency graph of the `Makefile` for this repo:

![](https://github.com/SteveLane/makedeps-graph/blob/master/img/deps.png)

Once you have the container use one of the following two commands to create the graph, depending on how you got the container.

If you pulled the container from dockerhub:

```sh
$ docker run -v $(pwd):/tmp/graph stevelane/makedeps-graph
```

If you built the container from the dockerfile in this repo:

```sh
$ docker run -v $(pwd):/tmp/graph makedeps-graph
```
