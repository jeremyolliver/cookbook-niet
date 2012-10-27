#
# Cookbook Name:: niet
# Provider::install
#
# Copyright 2012, Jeremy Olliver
#
# All rights reserved - Do Not Redistribute
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
