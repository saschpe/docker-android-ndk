FROM saschpe/android-sdk:28_28.0.3
LABEL maintainer="Sascha Peilicke <sascha@peilicke.de"
LABEL description="Android NDK"

ENV NDK_ROOT $ANDROID_SDK_ROOT/ndk-bundle

RUN yes | sdkmanager \
        "cmake;3.6.4111459" \
        "cmake;3.10.2.4988404" \
        "ndk-bundle" >/dev/null \
    && rm -rf  \
        # Delete simpleperf tool
        $NDK_ROOT/simpleperf \
        # Delete STL version we don't care about
        $NDK_ROOT/sources/cxx-stl/stlport \
        $NDK_ROOT/sources/cxx-stl/gnu-libstdc++ \
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

