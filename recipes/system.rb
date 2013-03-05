#
# Cookbook Name:: niet
# Recipe:: system
#
# Copyright 2012, Jeremy Olliver
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

include_recipe("niet::default") # Ensure niet is installed

service_options = {:processes => node[:niet][:processes]}

template "/etc/init.d/niet" do
  source "init.sh.erb"
  variables service_options
  owner 'root'
  group 'root'
  mode '0755'
end

service "niet" do
  supports :start => true, :stop => true, :restart => true, :kill => true
  action [:enable, :start]
end
