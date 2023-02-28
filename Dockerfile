#
# Android NDK + SDK container image with build-tools.
#
# Contains JDK, Android SDK, Android NDK and Android Build Tools. Each version is
# configurable. Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 33 --jdk 17.0.6_10 --ndk 25.2.9519653 --cmake 3.22.1
#

ARG jdk=17.0.6_10
ARG android=33

FROM saschpe/android-sdk:${android}-jdk${jdk}
ARG cmake=3.22.1
ARG ndk=25.2.9519653
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android} using JDK ${jdk}"

ENV NDK_ROOT "${ANDROID_SDK_ROOT}/ndk/${ndk}"
RUN sdkmanager --install \
    "cmake;${cmake}" \
    "ndk;${ndk}"
