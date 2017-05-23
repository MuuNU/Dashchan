# Copyright 2014-2016 Fukurou Mishiranu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

LOCAL_PATH_SRC_PLAYER := $(LOCAL_PATH)
include $(LOCAL_PATH_SRC_PLAYER)/ffmpeg/Android.mk
include $(LOCAL_PATH_SRC_PLAYER)/yuv/Android.mk
LOCAL_PATH := $(LOCAL_PATH_SRC_PLAYER)

include $(CLEAR_VARS)
LOCAL_MODULE := player
LOCAL_SRC_FILES := native.c player.c util.c
LOCAL_CFLAGS += -std=c99
LOCAL_LDLIBS += -llog -landroid -lOpenSLES
LOCAL_SHARED_LIBRARIES := avcodec avformat avutil swresample swscale yuv
include $(BUILD_SHARED_LIBRARY)