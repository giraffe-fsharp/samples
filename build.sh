#!/bin/sh
set -eu
cd "$(dirname "$0")"
find demo-apps -name '*.fsproj' ! -name '*.Tests.fsproj' -print | sort | while IFS= read -r project; do
    dotnet build "$project" --configuration Release
done
dotnet test demo-apps/SampleApp/SampleApp.Tests/SampleApp.Tests.fsproj --configuration Release
