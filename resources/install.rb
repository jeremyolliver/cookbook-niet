#
# Cookbook Name:: niet
# Resource::install
#
# Copyright 2012, Jeremy Olliver
#
# All rights reserved - Do Not Redistribute
#

actions :run

#Installation attributes
# attribute :version, :kind_of => String
attribute :download_url,  :kind_of => String
attribute :download_dir,  :kind_of => String, :default => Chef::Config[:file_cache_path]
attribute :base_name,     :kind_of => String, :default => 'niet'
attribute :tag,           :kind_of => String, :default => 'master'
attribute :artifact_type, :kind_of => String, :default => 'tar.gz'
attribute :safe_install,  :kind_of => [ TrueClass, FalseClass ], :default => true

#Configuration attributes
attribute :users, :kind_of => Array, :default => []
# attribute :default_settings, :kind_of => Hash

def initialize(name, run_context=nil)
  super
  @action = :run
  @tarball = nil
end
