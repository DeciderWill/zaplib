#!/bin/bash

set -euo pipefail

# Per https://stackoverflow.com/a/16349776
cd "${0%/*}/../.."

# We build to a fresh target directory to make sure we don't have any stale files that we
# copy to the website.
rm -rf website_dev/

# Run the developer version of this script.
zaplib/scripts/build_website_dev.sh

# Copy over just the files that we actually want to ship.
rm -rf website/
echo "17"
mkdir website/
echo "29"
cp -R zaplib/website_root/* website/
echo "21"
cp -R website_dev/docs website/docs
echo "23"
mkdir website/target
echo "25"
cp -R website_dev/target/doc website/target/doc
echo "27"
cp -R website_dev/*.html website/
echo "29"
mkdir -p website/target/wasm32-unknown-unknown/release/
echo "31"
cp website_dev/target/wasm32-unknown-unknown/release/*.wasm website/target/wasm32-unknown-unknown/release/
echo "33"
mkdir -p website/zaplib/web/dist/
echo "35"
cp -R website_dev/zaplib/web/dist/* website/zaplib/web/dist/
echo "37"
mkdir -p website/zaplib/examples/example_bigedit/src/
echo "39"
cp website_dev/zaplib/examples/example_bigedit/src/treeworld.rs website/zaplib/examples/example_bigedit/src/treeworld.rs
echo "41"

echo 'Website generated for publishing! Host using `cargo zaplib serve website/ --port 4848` or publish `website/`'
