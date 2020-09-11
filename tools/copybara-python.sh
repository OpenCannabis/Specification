#!/bin/sh

echo "Performing migration for external repo 'python'..."
java -jar .env/copybara.jar migrate copy.bara.sky python --ignore-noop;
