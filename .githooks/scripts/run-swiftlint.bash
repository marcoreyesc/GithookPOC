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
    if ["$count" -ne 0]; then
        $SWIFT_LINT \
            --quiet \
	    --output $PROJECT_ROOT/.githooks/output/swiftlint.result \
	    --use-script-input-files \
	    --strict \
	    --config .swiftlint.yml
        if [ $? -ne 0 ]; then
 	    echo "SwiftLint has warnings see ouput file: ${PROJECT_ROOT}/.githooks/output/swiftlint.result"
	    exit 1
        fi
    fi
fi
