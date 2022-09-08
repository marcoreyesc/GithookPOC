#!/usr/bin/env bash

PROJECT_ROOT=$(git rev-parse --show-toplevel)

xcodebuild \
  -workspace $PROJECT_ROOT/GithookPOC.xcworkspace \
  -scheme GithookPOCTests \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
  test 2> $PROJECT_ROOT/.githooks/output/tests.result
if [ $? -ne 0 ]; then
  echo "Test failed"
  exit 1
fi
