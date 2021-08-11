#!/bin/bash

## Run this script from the project root to build the Java SDK:
# 'bash sdk/java/publish.sh [pomfile] [jarfile] [version] [profile]'

echo "---- Deploying artifacts ('$1' version '$3')... ----";
set -x
mvn -Prelease,$4 \
    -f $1 \
    gpg:sign-and-deploy-file \
      -DrepositoryId=artifact-registry-cookies \
      -Durl=artifactregistry://us-maven.pkg.dev/cookies-co/sdk-java \
      -DpomFile=$1 \
      -Dfile=$2 \
      -Dsdk.revision=$3;
