#!/usr/bin/env bash

echo "BASH"

xcodebuild \
  -project GithookPOC.xcodeproj \
  -scheme GithookPOCTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
  test
