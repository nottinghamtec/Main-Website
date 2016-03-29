#!/bin/bash

# enable error reporting to the console
set -e

echo "Bundle path: $BUNDLE_PATH"
echo "Pull Request: $TRAVIS_PULL_REQUEST"

if [[ "$TRAVIS_BUILD_NUMBER" ]]
then
  echo $TRAVIS_BUILD_NUMBER > _includes/travis_build_number.txt
fi

# If staging setup CNAME and SEO block
if [[ $TRAVIS_PULL_REQUEST = "false" && $TRAVIS_BRANCH = "staging" ]]
  then
  mv CNAME.staging CNAME
fi
