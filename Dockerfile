#
# Android NDK OCI / Docker image.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 35 --jdk 23.0.2_7 --ndk 28.0.13004108 --cmake 3.31.5
#

ARG jdk=23.0.2_7
ARG android=35

FROM saschpe/android-sdk:${android}-jdk${jdk}
ARG android
ARG cmake=3.31.5
ARG jdk
ARG ndk=28.0.13004108
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android} using JDK ${jdk}"

USER nonroot
ENV NDK_ROOT="${ANDROID_SDK_ROOT}/ndk/${ndk}"
RUN sdkmanager --install \
    "cmake;${cmake}" \
    "ndk;${ndk}"
