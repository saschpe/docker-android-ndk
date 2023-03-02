# Android NDK OCI / Docker image

![GitHub License](https://img.shields.io/github/license/saschpe/docker-android-ndk)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/saschpe/docker-android-ndk/CI)
![Docker Automated build](https://img.shields.io/docker/automated/saschpe/android-ndk)
![Docker Pulls](https://img.shields.io/docker/pulls/saschpe/android-ndk)

Android Native Development Kit (NDK) OCI image including CMake based on `saschpe/android-sdk`.

## Usage

Use like you would any other base image:

```Dockerfile
FROM saschpe/android-ndk
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
