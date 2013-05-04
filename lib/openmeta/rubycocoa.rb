#!/usr/bin/ruby
# -*- coding: utf-8 -*-

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
      @error ||= OSX::NSError.new
    end

    # **note** returned array are frozen
    def get_tags(path)
      path = File.expand_path(path)
      unless File.exist?(path)
        raise Openmeta::ObjCError, "#{path} does not exist!"
      end
      OSX::OpenMeta.getUserTags_error_(path, error)
    end

    def set_tags(new_tags, path)
      path = File.expand_path(path)

      unless File.exist?(path)
        raise Openmeta::ObjCError, "#{path} does not exist!"
      end
      existing_tags = OSX::OpenMeta.getUserTags_error_(path, error)

      if e = OSX::OpenMeta.setUserTags_path_(new_tags, path)
        raise Openmeta::ObjCError, e.inspect
      end

      OSX::OpenMetaPrefs.updatePrefsRecentTags_newTags_(existing_tags, new_tags)
    end

    def add_tags(new_tags, to_files)
      to_files = fu_list(to_files)

      to_files.each { |file|
        existing_tags = get_tags(file)

        if e = OSX::OpenMeta.addUserTags_path_(new_tags, file)
          raise Openmeta::ObjCError, e.inspect
        end

        OSX::OpenMetaPrefs.updatePrefsRecentTags_newTags_(existing_tags, new_tags)
      }
    end

    def remove_tags(tags, from_files)
      from_files = fu_list(from_files)

      return if tags.empty?

      from_files.each { |file|
        existing_tags = get_tags(file) # frozen array
        next if existing_tags.nil? or existing_tags.empty?

        set_tags(existing_tags - tags, file)
      }
    end

    def get_rating(path)
      path = File.expand_path(path)
      unless File.exist?(path)
        raise Openmeta::ObjCError, "#{path} does not exist!"
      end

      OSX::OpenMeta.getRating_error_(path, error)
    end

    def set_rating(rating, path)
      e = OSX::OpenMeta.setRating_path_(rating, File.expand_path(path))
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

      to_files = fu_list(to_files)
      to_files.each { |file|
        set_tags(tags, file) unless (tags == nil or tags.empty?)
        set_rating(rating, file) unless rating == 0.0
      }
    end

    def clear(files)
      files = fu_list(files)
      files.each { |file|
        set_tags([], file)
        set_rating(0.0, file)
      }
    end


    def recent_tags
      OSX::OpenMetaPrefs.recentTags
    end

    private

    def fu_list(arg)   #:nodoc:
      [arg].flatten.map {|path| File.expand_path(path) }
    end

  end

end

