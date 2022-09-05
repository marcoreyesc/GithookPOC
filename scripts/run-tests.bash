#!/bin/sh

# A hook script to run Xcode unit tests before committing.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.

WORKSPACE_PATH="GithookPOC.xcodeproj"
SCHEME="GithookPOC"
SDK="iphonesimulator"
 
DEFAULT_TASK="xcodebuild -project $WORKSPACE_PATH -scheme $SCHEME -sdk $SDK"

# xcpretty makes output nicer
if hash xcpretty 2>/dev/null; then
    $DEFAULT_TASK | xcpretty -t; exit ${PIPESTATUS[0]}
else
    $DEFAULT_TASK
fi








#!/usr/bin/env bash

#echo "BASH"

#xcodebuild \
#  -project GithookPOC.xcodeproj \
#  -scheme GithookPOCTests \
#  -sdk iphonesimulator \
#  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
#  test | xcpretty --test --color
#if [ $? -ne 0 ]; then
# echo “Tests must pass before commit!”
# exit 1
#fi
#exit 0
