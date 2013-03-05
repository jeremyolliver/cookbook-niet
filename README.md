Description
===========

Installs niet from source. Niet is a lightweight process monitor. Run processes underneath it, and if they die, they'll be respawned.
No other monitoring of sub processes is done. If you need logging, you'll have to configure syslog too

For more information see: https://github.com/willbryant/niet

Requirements
============

Attributes
==========

* niet[:install_source] = "https://github.com/willbryant/niet/tarball"
* niet[:tag]            = "master"
* niet[:artifact_type]  = "tar.gz"
* niet[:safe_install]   = true
* niet[:processes]      = {}

Usage
=====

Niet
----

Just include the default recipe, and the niet binary will be compiled and installed to the system available to use

  `niet -c /cd/to/here /run/this/binary`

Startup scripts
---------------

Warning - these /etc/init.d style scripts have only been tested on ubuntu

Usage: set attributes for the user and path to executable file to run, e.g.

chef

    node.set[:niet][:processes] = {
      "myuser" => "/path/to/myscript.sh"
    }

executable file "/path/to/myscript.sh"

    #! /bin/bash
    niet -c /process/start_dir /important/binary/to/run.sh

The niet service wrapper will now launch this executable file as the user "myuser". The restart/start/stop actions will gracefully target the niet processes with the correct control signals


TODO
====

rewrite startup scripts to configure via `/etc/niet.d/` configuration directory

License
=======

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
