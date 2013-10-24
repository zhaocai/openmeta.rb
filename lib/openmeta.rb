#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

if defined? MACRUBY_VERSION
  framework "OpenMeta"
  require 'openmeta/macruby'
elsif RUBY_VERSION < "1.9"

  require 'osx/cocoa'
  require 'rubygems'
  require 'openmeta/rubycocoa'
  begin
    OSX::require_framework 'OpenMeta'
  rescue ArgumentError => e
    raise ArgumentError, %Q{
   _   _       _       _
  | \ | | ___ | |_ ___| |
  |  \| |/ _ \| __/ _ \ |
  | |\  | (_) | ||  __/_|
  |_| \_|\___/ \__\___(_)

  You need to manually install OpenMeta.framework!

  The package is installed to `gem which openmeta.rb`/resource/OpenMeta.framework.pkg

  
  #{e.message}
  #{e.backtrace.join("\n")}
  }
  end
else
  raise NotImplementedError, "(openmeta.rb) only work with macruby or system ruby"
end

