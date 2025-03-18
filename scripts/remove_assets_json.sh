#!/bin/bash

readonly GREEN=$'\e[0;32m'

sed -i.backup '/^[[:space:]]*- assets\/json\//!b
/assets\/json\/market_static_content\//b
d' pubspec.yaml

rm 'pubspec.yaml.backup'    

echo "${GREEN}👍 Remove Json assets succescfully!" exit 0