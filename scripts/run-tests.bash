#!/usr/bin/env bash

echo "BASH"

xcodebuild \
  -project GithookPOC.xcodeproj \
  -scheme GithookPOCTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
  test | xcpretty --test --color
echo $?
if [ $? -ne 0 ]; then
 echo “Tests must pass before commit!”
 exit 1
fi
exit 0
