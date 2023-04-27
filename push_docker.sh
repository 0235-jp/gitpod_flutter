#!/bin/bash
cd `dirname $0`

source version

echo $DOCKER_PASSWORD | docker login --username $DOCKER_USER_NAME --password-stdin

docker push kitproject/gitpod-flutter-base:lastest
docker push kitproject/gitpod-flutter-base:stable
docker push kitproject/gitpod-flutter-base:beta
docker push kitproject/gitpod-flutter-base:v${FLUTTER_STABLE_VERSION/+/-}
docker push kitproject/gitpod-flutter-base:v${FLUTTER_BETA_VERSION/+/-}
docker push kitproject/gitpod-flutter-android:lastest
docker push kitproject/gitpod-flutter-android:stable
docker push kitproject/gitpod-flutter-android:beta
docker push kitproject/gitpod-flutter-android:v${FLUTTER_STABLE_VERSION/+/-}
docker push kitproject/gitpod-flutter-android:v${FLUTTER_BETA_VERSION/+/-}
