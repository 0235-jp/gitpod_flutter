#!/bin/bash
cd `dirname $0`

source version

docker login --username $DOCKER_USER_NAME --password $DOCKER_PASSWORD

docker push kitproject/gitpod-flutter-base:lastest
docker push kitproject/gitpod-flutter-base:v${FLUTTER_VERSION/+/-}
docker push kitproject/gitpod-flutter-android:lastest
docker push kitproject/gitpod-flutter-android:v${FLUTTER_VERSION/+/-}
