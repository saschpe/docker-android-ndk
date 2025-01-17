#
# Android NDK OCI / Docker image.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 35 --jdk 22.0.2_9 --ndk 25.2.9519653 --cmake 3.22.1
#

ARG jdk=22.0.2_9
ARG android=35

FROM saschpe/android-sdk:${android}-jdk${jdk}
ARG android
ARG cmake=3.22.1
ARG jdk
ARG ndk=27.0.12077973
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android} using JDK ${jdk}"

ENV NDK_ROOT="${ANDROID_SDK_ROOT}/ndk/${ndk}"
RUN sdkmanager --install \
    "cmake;${cmake}" \
    "ndk;${ndk}"
