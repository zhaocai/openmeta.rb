# -*- ruby -*-

require 'rubygems'
require 'hoe'
# require 'rake/distribute'

Hoe.plugin :gemspec
Hoe.plugin :git
Hoe.plugin :test

Hoe.spec 'openmeta.rb' do

  developer('Zhao Cai', 'caizhaoff@gmail.com')

  extra_deps << ['thor', '~> 0.17.0']
end

# distribute :FileItem do
#   from "bin/openmeta"
#   to   "/usr/local/bin/om", :mode => 0755
# end

bindir="/usr/local/bin"

desc "install"
task :install do
  open("#{bindir}/om", "w") { |f|
    f.puts "#!/bin/sh",
      %Q{VM_OPT_LEVEL=0 macruby #{File.expand_path("bin/openmeta")} "$@"}
  }
  chmod 0755, "#{bindir}/om"
end

desc "uninstall"
task :uninstall do
  safe_unlink "#{bindir}/om"
end

# vim: syntax=ruby
