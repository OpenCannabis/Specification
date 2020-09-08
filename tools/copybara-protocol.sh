#!/bin/bash

echo "Performing migration for external repo 'protocol'..."
java -jar ~/bin/copybara.jar migrate copy.bara.sky protocol --ignore-noop;

