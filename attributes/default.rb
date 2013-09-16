default[:niet][:install_source] = "https://github.com/willbryant/niet/archive"
default[:niet][:tag]            = "master"
default[:niet][:artifact_type]  = "tar.gz"
default[:niet][:safe_install]   = true

default[:niet][:processes]      = {}
# Set processes to a hash with key (username) and value to be an array of scripts to run under niet (supports * for a multi-file location string)
