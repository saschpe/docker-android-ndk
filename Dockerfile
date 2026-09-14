#
# Android NDK OCI / Docker image.
#
# Build and publish with default arguments:
#
#   $ ./scripts/build --push
#
# Build with custom arguments:
#
#   $ ./scripts/build --android 37.2 --jdk 23.0.2_7 --ndk 29.0.14206865 --cmake 3.31.6
#

ARG jdk=25.0.4_7
ARG android=37.2

FROM saschpe/android-sdk:${android}-jdk${jdk}
ARG android
ARG cmake=4.1.2
ARG jdk
ARG ndk=30.0.16248370
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de>"
LABEL description="Android NDK ${ndk} with CMake ${cmake} on SDK ${android} using JDK ${jdk}"

USER nonroot
ENV NDK_ROOT="${ANDROID_SDK_ROOT}/ndk/${ndk}"
RUN android sdk install cmake/${cmake} ndk/${ndk}
