#!/bin/bash

docker run -v ~/.ssh:/root/.ssh -v "$(pwd)":/usr/src/app -e COPYBARA_WORKFLOW='protocol' -it us.gcr.io/elide-ai/tools/copybara copybara;

