#!/bin/bash

date_hours=$(date +"%H")
hours=$(expr $date_hours \* 4)
quarterHours=$(expr $hours / 15)
revision=$(expr $hours + $quarterHours + 1)
random=$((10000 + $RANDOM % 99999))
buildId=$(date +"%q").${random}.${revision}

for file in $(find ./src/ -maxdepth 2 -name '*.csproj')
do
  dotnet pack $file \
    --configuration Release \
    -p:PackageVersion="7.0.0-preview.$buildId" \
    -p:RepositoryUrl=https://github.com/t1moH1ch/openiddict-core \
    -o artifacts/packages/Release/GitHub; \
done
