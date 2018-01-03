# Docker Android NDK
[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/saschpe/docker-android-ndk.svg?branch=master)](https://travis-ci.org/saschpe/docker-android-ndk)
[![Docker Pulls](https://img.shields.io/docker/pulls/saschpe/android-ndk.svg)](https://hub.docker.com/r/saschpe/android-ndk/)
[![Docker Build Status](https://img.shields.io/docker/build/saschpe/android-ndk.svg)](https://hub.docker.com/r/saschpe/android-ndk/)

Android NDK Docker container including CMake based on Alpine Linux.


## Usage
Use like you would any other base image:

    FROM saschpe/android-ndk
    RUN apk add --no-cache mysql-client
    ENTRYPOINT ["mysql"]


## Scripts
These scripts simplify various tasks related to container building and
publishing.

    .
    └─── scripts
        ├── docker
        │   ├── build           Build the container locally
        │   └── run             Run the container locally
        ├── inc.constants
        └── inc.functions


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
