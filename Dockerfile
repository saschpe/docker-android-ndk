#
# Android NDK + SDK container image with build-tools.
#
# Contains JDK, Android SDK, Android NDK and Android Build Tools. Each version is
# configurable. Build and publish with default arguments:
#
#   $ ./scripts/docker/build --docker-push
#
# Build with custom arguments:
#
#   $ ./scripts/docker/build --android-api 30 --ndk 21.1.6352462
#

ARG jdk=11.0.11_9
ARG android_api=31
ARG android_build_tools=30.0.3

FROM --platform=linux/amd64 saschpe/android-sdk:${android_api}_${android_build_tools}_jdk${jdk}
ARG cmake=3.18.1
ARG ndk=22.1.7171670
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android_api} with build-tools ${android_build_tools} using JDK ${jdk}"

ENV NDK_ROOT "${ANDROID_SDK_ROOT}/ndk/${ndk}"
RUN sdkmanager --install \
        "cmake;${cmake}" \
        "ndk;${ndk}" >/dev/null && \
    rm -rf  \
        # Delete simpleperf tool
        $NDK_ROOT/simpleperf \
        # Delete obsolete platforms
        $NDK_ROOT/platforms/android-16 \
        $NDK_ROOT/platforms/android-17 \
        $NDK_ROOT/platforms/android-18
