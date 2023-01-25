#!/bin/bash

# ./run.sh autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive openra
#docker-compose exec autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive classes
#docker-compose exec autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive fakes
#docker-compose exec autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive management
#docker-compose exec autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive services
#docker-compose exec autopep8 --in-place --aggressive --aggressive --global-config /src/.pep8 --recursive tests
#
./run.sh find -type f -name '*.py' ! -path '*/migrations/*' -exec autopep8 '{}' \;
