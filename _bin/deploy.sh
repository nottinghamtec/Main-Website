#!/bin/bash

# Only deploy if not PR
if [[ $TRAVIS_PULL_REQUEST == "false" ($TRAVIS_BRANCH = "master" || $TRAVIS_BRANCH = "staging")]]
  then
  # cleanup
  rm -rf gh-pages

  git clone -b gh-pages https://${GH_TOKEN}@${GH_REF} gh-pages

  if [[ $RESET == "true" ]]
  then
    rm -rf gh-pages/*
  fi

  # copy generated HTML site to built branch
  cp -R public/* gh-pages

  # commit and push generated content to built branch
  # since repository was cloned in write mode with token auth - we can push there
  cd gh-pages
  git config user.email "webmaster@nottinghamtec.co.uk"
  git config user.name "tecbot"
  git add -A .
  git commit -a -m "Travis Build $TRAVIS_BUILD_NUMBER for $TRAVIS_COMMIT"
fi

if [[ $TRAVIS_PULL_REQUEST = "false" && $TRAVIS_BRANCH = "master" ]]
  then
  git push --quiet origin gh-pages > /dev/null 2>&1 # Hiding all the output from git push command, to prevent token leak.
fi

if [[ $TRAVIS_PULL_REQUEST = "false" && $TRAVIS_BRANCH = "staging" ]]
  then
  git remote add origin https://${GH_TOKEN}@github.com/nottinghamtec/Main-Website-Staging.git
  git push --quiet -f origin gh-pages > /dev/null 2>&1 # Hiding all the output from git push command, to prevent token leak.
fi
