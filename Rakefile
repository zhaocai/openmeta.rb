# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'rake/clean'

Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :git
Hoe.plugin :test
Hoe.plugin :version

Hoe.spec 'openmeta.rb' do

  developer('Zhao Cai', 'caizhaoff@gmail.com')
  license 'GPL-3'

  extra_deps << ['thor', '~> 0.18.0']
  # extra_deps << ['filetype', '~> 0.3.0']


  extra_dev_deps << ['rspec']
  extra_dev_deps << ['hoe'] << ['hoe-gemspec'] << ['hoe-git'] << ['hoe-version'] << ['hoe-bundler']
  extra_dev_deps << ['guard'] << ['guard-rspec'] << ['terminal-notifier-guard'] << ['growl']

  post_install_message = %Q{
   _   _       _       _
  | \ | | ___ | |_ ___| |
  |  \| |/ _ \| __/ _ \ |
  | |\  | (_) | ||  __/_|
  |_| \_|\___/ \__\___(_)

  You need to manually install OpenMeta.framework!

  The package is installed to `gem which openmeta.rb`/resource/OpenMeta.framework.pkg

  }
end


%w{major minor patch}.each { |v|
  desc "Bump #{v.capitalize} Version"
  task "bump:#{v}", [:message] => ["version:bump:#{v}"] do |t, args|
    m = args[:message] ? args[:message] : "Bump version to #{ENV["VERSION"]}"
    sh "git commit -am '#{m}'"
  end
}

desc "automate guard rspec"
task :guard  do
  sh %q{bundle exec guard --group=system}
end

desc "multirubies"
task :multirubies  do
  sh %q{bundle exec guard --group=multirubies}
end

desc "Default Test"
task :default => [:spec] do
end

CLOBBER.include('log', 'vendor')
CLEAN.include('test/tmp')

# vim: syntax=ruby
