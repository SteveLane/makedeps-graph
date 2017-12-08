#!/usr/bin/env bash
# Creates Makefile dependency graphs for docker volume mounted at /tmp/graph
# This is a particular edge case!
cd /tmp/graph
make -Bnd | make2graph > deps.dot
make -Bnd | make2graph | dot -Tpng -o deps.png
