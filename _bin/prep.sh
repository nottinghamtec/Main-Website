#!/bin/bash

# If staging setup CNAME and SEO block
if [[ $TRAVIS_PULL_REQUEST = "false" && $TRAVIS_BRANCH = "staging" ]]
  then
  mv CNAME.staging CNAME
fi
