case RUBY_PLATFORM
when /darwin/
  framework "OpenMeta"
else
  raise NotImplementedError, "[Openmeta] does not support #{RUBY_PLATFORM}"
end

require 'openmeta/version'
module Openmeta

end



