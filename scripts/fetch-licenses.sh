#!/usr/bin/env sh
set -eu

mkdir -p LICENSES

echo "Fetching canonical licence texts..."

curl -fL "https://ohwr.org/cern_ohl_w_v2.txt"   -o LICENSES/CERN-OHL-2.0-W.txt

curl -fL "https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt"   -o LICENSES/CC-BY-SA-4.0.txt

curl -fL "https://raw.githubusercontent.com/spdx/license-list-data/main/text/MIT.txt"   -o LICENSES/MIT.txt

echo "Done."
echo "Review the downloaded files before committing them."
