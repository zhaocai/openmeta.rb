#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

($LOAD_PATH << File.expand_path("../openmeta/framework", __FILE__)).uniq!

if defined? MACRUBY_VERSION
  framework "OpenMeta"
  require 'openmeta/macruby'
elsif RUBY_VERSION < "1.9"
  
  require 'osx/cocoa'
  OSX::require_framework 'OpenMeta'
  require 'rubygems'
  require 'openmeta/rubycocoa'
else
  raise NotImplementedError, "(openmeta.rb) only work with macruby or system ruby"
end

