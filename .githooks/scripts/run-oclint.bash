#!/bin/bash

hash oclint &> /dev/null
if [ $? -eq 1 ]; then
echo >&2 "oclint not found, analyzing stopped"
exit 1
fi

PROJECT_ROOT=$(git rev-parse --show-toplevel)
cd ${PROJECT_ROOT}

pod install > ${PROJECT_ROOT}/build/reports/oclint.report
#echo cleaning
xcodebuild -target GithookPOC -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' -scheme GithookPOC -quiet clean 2>${PROJECT_ROOT}/build/reports/oclint.report
#echo building
  xcodebuild \
  -workspace GithookPOC.xcworkspace \
  -scheme GithookPOC \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 11,OS=15.5' \
  -quiet
  COMPILER_INDEX_STORE_ENABLE=NO \
  | xcpretty -r json-compilation-database \
  --output ${PROJECT_ROOT}/build/reports/compile_commands.json 2>${PROJECT_ROOT}/build/reports/oclint.report
if [ $? -ne 0 ]; then
  echo "colint error building"
  cat ${PROJECT_ROOT}/build/reports/oclint.report
fi 
#echo oclint
output=$(oclint-json-compilation-database -p ${PROJECT_ROOT}/build/reports 2>&1) 
if [[ $output != *'FilesWithViolations=0'* ]]; then
    echo "oclint error"
    echo $output
    exit 1
fi 
