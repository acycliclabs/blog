#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e8738539673b90014b790aa/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e8738539673b90014b790aa
curl -s -X POST https://api.stackbit.com/project/5e8738539673b90014b790aa/webhook/build/ssgbuild > /dev/null
npm run build
curl -s -X POST https://api.stackbit.com/project/5e8738539673b90014b790aa/webhook/build/publish > /dev/null
