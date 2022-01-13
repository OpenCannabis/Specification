#!/bin/bash

## Run this script from the project root to build the Java SDK:
# 'source sdk/java/build.sh'

echo "Building OpenCannabis SDK for Java...";
make build TARGETS="//sdk/java //sdk/java:labservices" RELEASE=yes;

echo "Exporting SDK artifacts...";
cp -fv dist/bin/sdk/java/java-sdk-v2.tar ./sdk/java;

echo "Compressing SDK artifacts...";
rm -fv ./sdk/java/java-sdk-v2.tar.gz;
gzip -f --best ./sdk/java/java-sdk-v2.tar;

echo "Java SDK build complete.";
