require 'thor'
require 'openmeta/ui'

module Openmeta

  class CLI < Thor

    def initialize(*)
      super
      Openmeta.ui = UI::Shell.new(options)
      Openmeta.ui.level = "debug" if options["verbose"]
    end

    desc "recent", "print recent tags"
    method_option :format,
      :aliases      => "-f"                  ,
      :lazy_default => nil                   ,
      :type         => :string               ,
      :desc         => "print as yaml/plist"
    def recent
      puts_to(options[:format], Openmeta.recent_tags)
    end

    desc "clone", "clone openmeta tags and rating"
    method_option :from,
      :aliases  => "-f",
      :required => true,
      :type     => :string,
      :desc     => "clone openmeta tags and rating from the FILE [required]"
    def clone(*files)
      Openmeta.clone(options[:from], files)
    end

    desc "get", "get openmeta tags and rating"
    method_option :format,
      :aliases      => "-f"                  ,
      :lazy_default => nil                   ,
      :type         => :string               ,
      :desc         => "print as yaml/plist"
    def get(*files)
      files.each { |file|
        tags = {
          :tags => Openmeta.get_tags(file),
          :rating => Openmeta.get_rating(file)
        }
        puts_to(options[:format], tags)
      }
    end

    desc "clear", "clear openmeta tags and rating"
    def clear(*files)
      Openmeta.clear(files)
    end


    desc "set", "set openmeta tags, use ',' to separate multiple tags"
    method_option :tag,
      :aliases      => "-t"       ,
      :lazy_default => ''         ,
      :type         => :string    ,
      :desc         => "set tags, use ',' to separate multiple tags"
    def set(*files)
      files.each { |file|
        tags = options[:tag].split(',')
        Openmeta.set_tags(tags, file)
      }
    end

    desc "add", "add openmeta tags, use ',' to separate multiple tags"
    method_option :tag,
      :aliases      => "-t"       ,
      :lazy_default => ''         ,
      :type         => :string    ,
      :desc         => "add tags, use ',' to separate multiple tags"
    def add(*files)
      tags = options[:tag].split(',')
      Openmeta.add_tags(tags, files)
    end

    desc "remove", "remove openmeta tags, use ',' to separate multiple tags"
    method_option :tag,
      :aliases      => "-t"       ,
      :lazy_default => ''         ,
      :type         => :string    ,
      :desc         => "remove tags, use ',' to separate multiple tags"
    def remove(*files)
      tags = options[:tag].split(',')
      Openmeta.remove_tags(tags, files)
    end

    desc "rate", "set openmeta rating"
    method_option :rate,
      :aliases      => "-r"       ,
      :lazy_default => 0.0        ,
      :type         => :numeric   ,
      :desc         => "set rating"
    def rate(*files)
      files.each { |file|
        if options[:rate] > 5.0
          raise RangeError, "rating is between [0.0 - 5.0]"
        end
        Openmeta.set_rating(options[:rate], file)
      }
    end

  private
    def puts_to(format, data)
      unless format
        puts data
      else
        require 'yaml' if format == 'yaml'
        to_format = "to_#{format}"

        begin
          puts data.send(to_format)
        rescue NoMethodError
          raise Openmeta::NoMethodError, "#{to_format} has not implemented!"
        end
      end

    end
  end
end
