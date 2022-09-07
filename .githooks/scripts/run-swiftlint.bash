#!/bin/bash

PROJECT_ROOT=$(git rev-parse --show-toplevel)
SWIFT_LINT=$PROJECT_ROOT/Pods/SwiftLint/swiftlint

if [[ -e "${SWIFT_LINT}" ]]; then
    # Export files in SCRIPT_INPUT_FILE_$count to lint against later
    count=0
    while IFS= read -r file_path; do
        export SCRIPT_INPUT_FILE_$count="$file_path"
        count=$((count + 1))
    done < <(git diff --name-only --cached --diff-filter=d | grep ".swift$")
    export SCRIPT_INPUT_FILE_COUNT=$count

    #echo "Found $count lintable files! Linting now.."
    $SWIFT_LINT --use-script-input-files --strict --config .swiftlint.yml
    RESULT=$? # swiftline exit value is number of errors

    exit $RESULT
else
    #echo "⚠️  WARNING: SwiftLint not found in $SWIFT_LINT"
    #echo "⚠️  You might want to edit .git/hooks/pre-commit to locate your swiftlint"
    exit 0
fi
