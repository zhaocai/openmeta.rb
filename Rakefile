# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :gemspec
Hoe.plugin :bundler
Hoe.plugin :git
Hoe.plugin :test
Hoe.plugin :version

Hoe.spec 'openmeta.rb' do

  developer('Zhao Cai', 'caizhaoff@gmail.com')

  extra_deps << ['thor', '~> 0.17.0']
end

%w{major minor patch}.each { |v| 
  desc "Bump #{v.capitalize} Version and Commit"
  task "bump:#{v}", [:message] => ["version:bump:#{v}"] do |t, args|
    m = args[:message] ? args[:message] : "Bump version to #{ENV["VERSION"]}"
    sh "git commit -am '#{m}'"
  end
}

# vim: syntax=ruby
