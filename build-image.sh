#!/bin/sh

#Wrapper used to build the container using a Dockerfile placed in the same directory as this file
docker build --rm -t circleci-php801-composer-deploy .
