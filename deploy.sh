#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then 
    echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!" 
    exit 0
fi

rev=$(git rev-parse --short HEAD)

cd docs

git initgit config user.name "blackplume"

git config user.email "qingyu.s@foxmail.com"

git remote add upstream "https://github.com/blackplume233/development-of-games.git"

git fetch upstream

git reset upstream/master

echo "blackplume" > CNAME

git add -A

git commit -m "rebuild pages at ${rev}"

git push -q upstream HEAD:master