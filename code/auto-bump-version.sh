#!/bin/bash
set -e

PACKAGE_NAME=`node -p -e "require('./package.json').name"`
PACKAGE=`node -p -e "require('./package.json').version"`
PUBLISH=`npm view $PACKAGE_NAME version`

echo "Current Package Version: $PACKAGE"
echo "Current Published Version: $PUBLISH"

if [[ ! "$PACKAGE" > "$PUBLISH" ]]; then
  while [[ ! "$PACKAGE" > "$PUBLISH" ]]
    do
    echo "The package version $PACKAGE already exists in our registry."
    echo "Running npm version patch to solve this..."
    echo ""
    # check if version contains alpha
    if [[ $PACKAGE =~ "alpha" ]]; then
      # this first patch fix the alpha adding syntax
      npm version prepatch --preid=alpha --no-git-tag-version
    else
      npm version patch --no-git-tag-version
    fi

    PUBLISH=`npm view $PACKAGE_NAME version --no-git-tag-version`
    PACKAGE=`node -p -e "require('./package.json').version"`        
  done

  echo "NEW package version to be published: $PACKAGE"

  git config --global user.email "auto-bump-version@automation.com"
  git config --global user.name "Bash Automation"

  echo "git remote -v"
  git remote -v
  
#   echo "git checkout .npmrc"
#   git checkout .npmrc
  
  echo "add package.json"
  git add package.json
  
  echo "git status"
  git status
  
  # adding [skip ci] to commit message will not trigger Build Pipeline again
  echo "git commit -m \"Auto bump NPM version $PACKAGE by $CODEBUILD_INITIATOR [skip ci]\""
  git commit -m "Auto bump NPM version $PACKAGE by $CODEBUILD_INITIATOR [skip ci]"
  
  echo "Push to $CODEBUILD_SOURCE_VERSION ..."
  git push origin HEAD:$CODEBUILD_SOURCE_VERSION --porcelain
  
fi