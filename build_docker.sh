#!/bin/bash
cd `dirname $0`

source version

docker build --tag kitproject/gitpod-flutter-base:lastest \
             --tag kitproject/gitpod-flutter-base:v${FLUTTER_VERSION/+/-} \
             --build-arg FLUTTER_VERSION=$FLUTTER_VERSION \
             --no-cache \
             --file Dockerfile_base .

docker build --tag kitproject/gitpod-flutter-android:lastest \
             --tag kitproject/gitpod-flutter-android:v${FLUTTER_VERSION/+/-} \
             --build-arg ANDROID_SDK_VERSION=$ANDROID_SDK_VERSION \
             --build-arg ANDROID_NDK_VERSION=$ANDROID_NDK_VERSION \
             --build-arg BUILD_TOOLS_VERSION=$BUILD_TOOLS_VERSION \
             --build-arg PLATFORMS_VERSION=$PLATFORMS_VERSION \
             --build-arg SOURCES_VERSION=$SOURCES_VERSION \
             --no-cache \
             --file Dockerfile_android .

docker build --tag kitproject/gitpod-flutter-idea:lastest \
             --tag kitproject/gitpod-flutter-idea:v${FLUTTER_VERSION/+/-} \
             --build-arg IDEA_VERSION=$IDEA_VERSION \
             --build-arg FLUTTER_PLUGIN_URL=$FLUTTER_PLUGIN_URL \
             --build-arg DART_PLUGIN_URL=$DART_PLUGIN_URL \
             --no-cache \
             --file Dockerfile_idea .

docker build --tag kitproject/gitpod-flutter-full:lastest \
             --tag kitproject/gitpod-flutter-full:v${FLUTTER_VERSION/+/-} \
             --build-arg IDEA_VERSION=$IDEA_VERSION \
             --build-arg FLUTTER_PLUGIN_URL=$FLUTTER_PLUGIN_URL \
             --build-arg DART_PLUGIN_URL=$DART_PLUGIN_URL \
             --no-cache \
             --file Dockerfile_full .
