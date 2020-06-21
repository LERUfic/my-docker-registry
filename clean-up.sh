#!/bin/bash

docker stop registry
docker rm registry
rm -rf /mnt/registry
mkdir -p /mnt/registry
