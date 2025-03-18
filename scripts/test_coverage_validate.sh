#!/bin/bash

readonly GREEN=$'\e[0;32m'
readonly RED=$'\e[0;31m'

minCoverage="${MIN_TEST_COVERAGE}"
echo $minCoverage

flutter pub global activate test_cov_console
totalCoverage="$(flutter pub global run test_cov_console -t | cut -d. -f1)"
echo $totalCoverage

if ((totalCoverage < $minCoverage)); then
    printf "${RED} 👎 Coverage is below %s%%. Auron is not happy!\n" "$minCoverage" >&2
    exit 1
fi

printf "${GREEN}👍 Coverage is above %s%%.\n" "$minCoverage"
exit 0