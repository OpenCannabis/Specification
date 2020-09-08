#!/bin/bash

docker run -e ~/.ssh:/root/.ssh -v "$(pwd)":/usr/src/app -e COPYBARA_WORKFLOW='python' -it us.gcr.io/elide-ai/tools/copybara copybara;

