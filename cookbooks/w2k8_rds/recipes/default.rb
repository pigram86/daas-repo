#
# Cookbook Name:: w2k8_rds
# Recipe:: default
#
# Copyright 2013, Todd Pigram, LLC
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

# install RDS
powershell "RDS" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature RDS-RD-Server
  EOH
  not_if {reboot_pending?}
end


# Install desktop experience
powershell "desktop_experience" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Desktop-Experience
  EOH
  not_if {reboot_pending?}
end

powershell "XPS" do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature XPS-Viewer
  EOH
  not_if {reboot_pending?}
end

# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'cause chef said so'
  only_if {reboot_pending?}
end 
