# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'rake/distribute'

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

distribute :FileItem do
  from "bin/openmeta"
  to   "/usr/local/bin/openmeta.rb", :mode => 0755
end


desc "install"
task :install => ["distribute:install", 'install_gem']
# vim: syntax=ruby
