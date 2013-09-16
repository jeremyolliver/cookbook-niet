# Changelog for niet cookbook

## v0.1.2:

* Better platform support for the `niet::service` recipe's init script (specifically fixes for rhel).
Added LSB init comments detailing run levels. This should ensure the service enable works on platforms that support LSB init (includes rhel family with chkconfig)
* Bugfix: Github download - github have changed their archive download URL's this should be working again

## v0.1.1:

* Added niet::system recipe to support niet processes that start on boot & service wrappers

## v0.1.0:

* Initial release of cookbook. Provides installation of niet process supervisor
