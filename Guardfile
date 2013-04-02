require 'guard/rspec'

notification :growl
# notification :terminal_notifier

group :backend do

  guard 'rspec', :rvm  => ["macruby"], :notification  => true  do

    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end

end



