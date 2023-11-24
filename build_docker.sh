#!/bin/bash
cd `dirname $0`

source version

docker build --tag kitproject/gitpod-flutter-base:lastest \
             --tag kitproject/gitpod-flutter-base:stable \
             --tag kitproject/gitpod-flutter-base:v${FLUTTER_STABLE_VERSION/+/-} \
             --build-arg FLUTTER_CHANNEL=stable \
             --build-arg FLUTTER_VERSION=$FLUTTER_STABLE_VERSION \
             --no-cache \
             --file Dockerfile_base .

docker build --tag kitproject/gitpod-flutter-base:beta \
             --tag kitproject/gitpod-flutter-base:v${FLUTTER_BETA_VERSION/+/-} \
             --build-arg FLUTTER_CHANNEL=beta \
             --build-arg FLUTTER_VERSION=$FLUTTER_BETA_VERSION \
             --no-cache \
             --file Dockerfile_base .

docker build --tag kitproject/gitpod-flutter-android:lastest \
             --tag kitproject/gitpod-flutter-android:stable \
             --tag kitproject/gitpod-flutter-android:v${FLUTTER_STABLE_VERSION/+/-} \
             --build-arg ANDROID_SDK_VERSION=$ANDROID_SDK_VERSION \
             --no-cache \
             --file Dockerfile_android_stable .

docker build --tag kitproject/gitpod-flutter-android:beta \
             --tag kitproject/gitpod-flutter-android:v${FLUTTER_BETA_VERSION/+/-} \
             --build-arg ANDROID_SDK_VERSION=$ANDROID_SDK_VERSION \
             --no-cache \
             --file Dockerfile_android_beta .
