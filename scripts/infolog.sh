#!/bin/sh

echo "Changes between $(git tag -l | tail -1)..$(git describe)"
echo ""
git log $(git tag -l | tail -1)..$(git describe) | git shortlog
git diff $(git tag -l | tail -1)..$(git describe) --stat


#echo "Changes between master..$(git describe)"
#echo ""
#git log master..$(git describe) | git shortlog
#git diff master..$(git describe) --stat
