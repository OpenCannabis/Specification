#!/bin/sh

echo "Performing migration for external repo 'protocol'..."
java -jar .env/copybara.jar migrate copy.bara.sky protocol --ignore-noop;
