#
# Cookbook Name:: putty
# Recipe:: default
#
# Copyright 2013, Todd Pigram
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:putty][:url] = "http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.63-installer.exe"
default[:putty][:file] = "C:/Program Files (x86)/PuTTY/putty.exe"