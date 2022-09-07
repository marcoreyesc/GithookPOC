#!/usr/bin/env bash

PROJECT_ROOT=$(git rev-parse --show-toplevel)

xcodebuild \
  -workspace $PROJECT_ROOT/GithookPOC.xcworkspace \
  -scheme GithookPOCTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
  test
