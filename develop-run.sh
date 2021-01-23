#!/bin/sh

#Launches the container with the shell in other to test
docker run -it --rm -v $(pwd):$(pwd) --name cci-php-dev circleci-php801-composer-deploy sh
