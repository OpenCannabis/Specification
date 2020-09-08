#!/bin/bash

echo "Validating Copybara config...";
docker run -v "$(pwd)":/usr/src/app -e COPYBARA_SUBCOMMAND='validate' -e COPYBARA_WORKFLOW='protocol' -it us.gcr.io/elide-ai/tools/copybara copybara;

