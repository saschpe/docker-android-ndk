# Android NDK OCI / Docker image

[![License](https://img.shields.io/github/license/saschpe/docker-android-ndk)](https://opensource.org/licenses/Apache-2.0)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/saschpe/docker-android-ndk/ci.yml?branch=main)](https://github.com/saschpe/docker-android-ndk/actions?query=branch%3Amain++)
[![Docker Pulls](https://img.shields.io/docker/pulls/saschpe/android-ndk)](https://hub.docker.com/r/saschpe/android-ndk)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/saschpe/android-ndk)](https://hub.docker.com/r/saschpe/android-ndk)

Android Native Development Kit (NDK) OCI image including CMake based on
Docker image `saschpe/android-sdk`.

## Android SDK, NDK, CMake and JDK support

The following JDK (horizontal axis) and Android SDK API level combinations are currently
available:

|    | 11 | 17 | 21 | 22 | 23 |
|----|----|----|----|----|----|
| 31 | ✅  | ✅  |    |    |    |
| 32 | ✅  | ✅  | ✅  | ✅  |    |
| 33 | ✅  | ✅  | ✅  | ✅  |    | 
| 34 | ✅  | ✅  | ✅  | ✅  | ✅  | 
| 35 |    | ✅  | ✅  | ✅  | ✅  |

* Android 35 image NDK versions: __27.2.12479018__ and __28.0.13004108__
    * Previous images: __25.2.9519653__, __26.2.11394342__ and __26.2.11394342__
* CMake version: __3.31.5__
    * Previous images: __3.22.1__, __3.31.1__

## Usage

```shell
docker pull saschpe/android-ndk:35-jdk21.0.5_11-ndk28.0.13004108-cmake3.31.5
```

Use as a base image:

```Dockerfile
FROM saschpe/android-ndk:35-jdk21.0.5_11-ndk28.0.13004108-cmake3.31.5
RUN sdkmanager --install emulator
```

## Building

These scripts simplify various tasks related to container building and
publishing:

```shell
./scripts/build --help
```

## License

    Copyright 2017 Sascha Peilicke

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
