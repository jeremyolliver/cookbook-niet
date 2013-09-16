maintainer       "Jeremy Olliver"
maintainer_email "jeremy.olliver@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures niet"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

# To be as lightweight as possible, we'll install the bare minimum packages ourselves instead of the whole cookbook
# depends "build-essential"

recommends "rsyslog" # Or any alternative syslog implementation. Niet will log to /var/log/user.{info|debug} if syslog is configured

provides "service[niet]"
provides "niet::default"
provides "niet::system"
