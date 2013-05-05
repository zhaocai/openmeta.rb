require 'guard/rspec'
require 'rubygems'

notification :growl
# notification :terminal_notifier

group :system do

  guard 'rspec', :rvm => ['system'], :notification  => true  do

    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end

end

group :multirubies do

  guard 'rspec', :rvm => ['system', "macruby-nightly"], :notification  => true  do

    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end

end


