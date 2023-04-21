#!/bin/bash
cd `dirname $0`

source version

echo $TOKEN | docker login ghcr.io -u $USER_NAME --password-stdin

docker push ghcr.io/kitproject-dev/gitpod-flutter-base:lastest
docker push ghcr.io/kitproject-dev/gitpod-flutter-base:v${FLUTTER_VERSION/+/-}
docker push ghcr.io/kitproject-dev/gitpod-flutter-android:lastest
docker push ghcr.io/kitproject-dev/gitpod-flutter-android:v${FLUTTER_VERSION/+/-}
