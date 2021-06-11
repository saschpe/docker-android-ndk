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
#   $ ./scripts/docker/build --android-api 30 --ndk ndk;21.1.6352462
#

ARG jdk=11
ARG android_api=30
ARG android_build_tools=30.0.3

FROM saschpe/android-sdk:jdk${jdk}_api${android_api}_${android_build_tools}
ARG cmake=3.18.1
ARG ndk=22.1.7171670
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android_api} with build-tools ${android_build_tools} using JDK ${jdk}"

ENV NDK_ROOT $ANDROID_SDK_ROOT/ndk/${ndk}

RUN yes | sdkmanager \
        "cmake;${cmake}" \
        "ndk;${ndk}" >/dev/null \
    && rm -rf  \
        # Delete simpleperf tool
        $NDK_ROOT/simpleperf \
        # Delete unused prebuild images
        $NDK_ROOT/prebuilt/android-mips* \
        # Delete obsolete Android platforms
        $NDK_ROOT/platforms/android-9 \
        $NDK_ROOT/platforms/android-12 \
        $NDK_ROOT/platforms/android-13 \
        $NDK_ROOT/platforms/android-15 \
        $NDK_ROOT/platforms/android-16 \
        # Delete unused platform sources
        $NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/mips* \
        $NDK_ROOT/sources/cxx-stl/llvm-libc++/libs/mips* \
        # Delete LLVM STL tests
        $NDK_ROOT/sources/cxx-stl/llvm-libc++/test \
        # Delete unused toolchains
        $NDK_ROOT/toolchains/mips \
        $NDK_ROOT/build/core/toolchains/mips* \
    && sdkmanager --list | sed -e '/Available Packages/q'

