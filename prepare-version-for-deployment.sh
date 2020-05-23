#!/bin/sh

MANIFEST_FILE=$(find . -name "precache-manifest*.js" -maxdepth 2)
MANIFEST_FILE=$(basename ${MANIFEST_FILE})
MANIFEST_SHA="${MANIFEST_FILE%.*}"
MANIFEST_SHA="${MANIFEST_SHA##*.}"

rm -rf dist
mkdir -p dist
mv build dist/$MANIFEST_SHA
mv dist/$MANIFEST_SHA/index.html dist/index.html
sed -i '' "s/REPLACE_WITH_LATEST_VERSION/$MANIFEST_SHA/g" dist/index.html
echo $MANIFEST_SHA > dist/latest
