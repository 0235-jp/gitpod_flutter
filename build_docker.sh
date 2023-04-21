#!/bin/bash
cd `dirname $0`

source version

docker build --tag ghcr.io/kitproject-dev/gitpod-flutter-base:lastest \
             --tag ghcr.io/kitproject-devdock/gitpod-flutter-base:v${FLUTTER_VERSION/+/-} \
             --build-arg FLUTTER_VERSION=$FLUTTER_VERSION \
             --no-cache \
             --file Dockerfile_base .

docker build --tag ghcr.io/kitproject-dev/gitpod-flutter-android:lastest \
             --tag ghcr.io/kitproject-dev/gitpod-flutter-android:v${FLUTTER_VERSION/+/-} \
             --build-arg ANDROID_SDK_VERSION=$ANDROID_SDK_VERSION \
             --build-arg BUILD_TOOLS_VERSION=$BUILD_TOOLS_VERSION \
             --build-arg PLATFORMS_VERSION=$PLATFORMS_VERSION \
             --build-arg SOURCES_VERSION=$SOURCES_VERSION \
             --no-cache \
             --file Dockerfile_android .
