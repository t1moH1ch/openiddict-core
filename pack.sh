#!/usr/bin/env bash

for file in $(find ./src/ -maxdepth 2 -name '*.csproj')
do
  dotnet pack $file \
    --configuration Release \
    -p:PackageVersion="7.0.0-preview" \
    -p:RepositoryUrl=https://github.com/t1moH1ch/openiddict-core \
    -o artifacts/packages/Release/GitHub; \
done