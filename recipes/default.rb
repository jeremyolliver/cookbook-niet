#
# Cookbook Name:: niet
# Recipe:: default
#
# Copyright 2012, Jeremy Olliver
#
# All rights reserved - Do Not Redistribute
#

# Need compilers
case node.platform
when 'debian','ubuntu'
  %w[tar build-essential].each do |pkg|
    package pkg do
      action :install
    end
  end
when 'redhat','centos','fedora','scientific','suse','amazon'
  %w[tar make automake gcc].each do |pkg|
    package pkg do
      action :install
    end
  end
end

niet = node['niet']
location = "#{niet[:install_source]}/#{niet[:tag]}" # ".#{niet[:artifact_type]}" # Github doesn't include the filetype suffix in it's download

niet_install "niet" do
  download_url location
  safe_install niet['safe_install'] # Don't override if we change the version etc
end
