#
# Cookbook Name:: vcenter_client
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

# install vcenter 5.1 client 
windows_package "vcenter" do 
  source node[:vcenter][:url]
  action :install
  not_if {reboot_pending?}
end

# if reboot is needed
windows_reboot 60 do 
  reason 'reboot pending'
  only_if {reboot_pending?}
end
