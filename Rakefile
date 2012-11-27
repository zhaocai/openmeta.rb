# -*- ruby -*-

require 'rubygems'
require 'hoe'
# require 'rake/distribute'

# Hoe.plugin :compiler
# Hoe.plugin :gem_prelude_sucks
Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :git
# Hoe.plugin :inline
Hoe.plugin :test
# Hoe.plugin :racc
# Hoe.plugin :rcov
# Hoe.plugin :rubyforge

Hoe.spec 'openmeta' do

  developer('Zhao Cai', 'caizhaoff@gmail.com')

  # self.rubyforge_name = 'openmetax' # if different than 'openmeta'
  extra_deps << ['thor', '>= 0.16.0']
end

# distribute :FileItem do
#   from "bin/openmeta"
#   to   "/usr/local/bin/openmeta.rb", :mode => 0755
# end

bindir="/usr/local/bin"

desc "install"
task :install do
  symlink File.expand_path("bin/openmeta"), "#{bindir}/openmeta.rb"
end

desc "uninstall"
task :uninstall do
  safe_unlink "#{bindir}/openmeta.rb"
end

# vim: syntax=ruby
