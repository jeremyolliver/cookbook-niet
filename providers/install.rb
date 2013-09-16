#
# Cookbook Name:: niet
# Provider::install
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

action :run do
  @tarball = "#{new_resource.base_name}-#{new_resource.tag}.#{new_resource.artifact_type}"

  unless (niet_exists? && new_resource.safe_install)
    Chef::Log.info("Installing niet (#{new_resource.tag}) from source")
    download
    unpack
    build
    install
  end
  configure
end

def niet_exists?
  exists = Chef::ShellOut.new("which niet")
  exists.run_command
  exists.exitstatus == 0 ? true : false
end

def download
  Chef::Log.info("Downloading niet source tarball from #{new_resource.download_url}")
  remote_file "#{new_resource.download_dir}/#{@tarball}" do
    source new_resource.download_url
  end
end

def unpack
  case new_resource.artifact_type
  when "tar.gz",".tgz"
    execute "cd #{new_resource.download_dir} && mkdir -p #{new_resource.base_name}-#{new_resource.tag} && tar zxf #{@tarball} --directory=#{new_resource.base_name}-#{new_resource.tag} --strip-components=1"
  else
    # TODO: we could support .zip as well (which github hosts)
    raise Chef::Exceptions::UnsupportedAction, "Current package type #{new_resource.artifact_type} is unsupported"
  end
end

def build
  execute "cd #{new_resource.download_dir}/#{new_resource.base_name}-#{new_resource.tag} && make clean && make"
end

def install
  execute "cd #{new_resource.download_dir}/#{new_resource.base_name}-#{new_resource.tag} && make install"
end

def configure
  # placeholder
end
