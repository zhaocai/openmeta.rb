#!/usr/bin/env macruby
# -*- coding: utf-8 -*-

def is_macruby?
  begin
    MACRUBY_VERSION
    return true
  rescue
    return false
  end
end

if is_macruby?
  ($LOAD_PATH << File.expand_path("../openmeta/framework", __FILE__)).uniq!
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
  class RangeError          < OpenmetaError; status_code(2) ; end
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

    # **note** returned array are frozen
    def get_tags(path)
      tags = OpenMeta.getUserTags(File.expand_path(path), error:error)
      if error.value
        raise Openmeta::ObjCError, error.value.inspect
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
      rating = OpenMeta.getRating(File.expand_path(path), error:error)
      if error.value
        raise Openmeta::ObjCError, error.value.inspect
      end
      rating
    end

    def set_rating(rating, path)
      e = OpenMeta.setRating(rating, path:File.expand_path(path))
      if e
        raise Openmeta::ObjCError, e.inspect
      end
    end

    def clone(from_file, to_files)
      unless File.exist?(from_file)
        raise Openmeta::PathError, "#{from_file} does not exist!"
      end

      tags = get_tags(from_file)
      rating = get_rating(from_file)

      files.each { |file|
        set_tags(tags, file) unless tags.empty?
        set_rating(rating, file) unless rating == 0.0
      }
    end

    def clear(files)
      files.each { |file|
        set_tags([], file)
        set_rating(0.0, file)
      }
    end

    def add_tags(tags, to_files)
      to_files.each { |file|
        t = tags
        existing_tags = get_tags(file)
        # union
        t |= existing_tags if existing_tags

        unless t.eql? existing_tags
          set_tags(t, file)
        end
      }
    end

    def remove_tags(tags, to_files)
      to_files.each { |file|
        # duplicate a frozen array
        existing_tags = get_tags(file).dup
        unless existing_tags.empty?
          existing_tags.delete_if { |t| tags.include?(t) }
          set_tags(existing_tags, file)
        end
      }
    end

  end

end

