def is_macruby?
  begin
    MACRUBY_VERSION
    return true
  rescue
    return false
  end
end

if is_macruby?
  framework "OpenMeta"
else
  raise NotImplementedError, "[Openmeta] only work with macruby"
end

require 'openmeta/version'
require 'openmeta/ui'
module Openmeta
  class OpenmetaError < RuntimeError
    def self.status_code(code)
      define_method(:status_code) { code }
    end
  end

  class ObjCError           < OpenmetaError; status_code(1) ; end
  class NoMethodError       < OpenmetaError; status_code(13) ; end
  class PathError           < OpenmetaError; status_code(14) ; end
  class DslError            < OpenmetaError; status_code(15) ; end


  class << self
    attr_writer :ui, :error

    def ui
      @ui ||= UI.new
    end

    def error
      @error ||= error = Pointer.new(:id)
    end

    def get_tags(path)
      tags = OpenMeta.getUserTags(path, error:error)
      if error.value
        raise Openmeta::ObjCError, error.value.to_s
      end
      tags
    end

    def set_tags(tags, path)
      e = OpenMeta.setUserTags(tags, path:File.expand_path(path))
      if e
        raise Openmeta::ObjCError, e.inspect
      end
    end

    def get_rating(path)
      rating = OpenMeta.getRating(path, error:error)
      if error.value
        raise Openmeta::ObjCError, error.value.to_s
      end
      rating
    end

    def set_rating(rating, path)
      e = OpenMeta.setRating(rating, path:File.expand_path(path))
      if e
        raise Openmeta::ObjCError, e.inspect
      end
    end

  end

end



