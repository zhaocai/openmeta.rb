
vendor = File.expand_path('../vendor', __FILE__)
$:.unshift(vendor) unless $:.include?(vendor)
require 'thor'
require 'openmeta/ui'

module Openmeta

  class CLI < Thor

    def initialize(*)
      super
      the_shell = (options["no-color"] || (not STDOUT.tty?) ? Thor::Shell::Basic.new : shell)
      Openmeta.ui = UI::Shell.new(the_shell)
      Openmeta.ui.debug! if options["verbose"]
    end

    desc "recent", "print recent tags"
    method_option :format,
      :aliases => "-f",
      :default => nil,
      :type    => :string,
      :desc    => "print as yaml/plist"
    def recent
      tags = OpenMetaPrefs.recentTags

      puts_to(options[:format], tags)
    end

    desc "clone", "clone openmeta tags and rating"
    method_option :from,
      :aliases  => "-f",
      :required => true,
      :type     => :string,
      :desc     => "clone openmeta tags and rating from the FILE [required]"
    def clone(file)
      unless File.exist?(from_file)
          raise Openmeta::PathError, "#{from_file} does not exist!"
      end

      tags = Openmeta.get_tags(from_file)
      rating = Openmeta.get_rating(from_file)

      Openmeta.set_tags(tags, file) unless tags.empty?
      Openmeta.set_rating(rating, file) unless rating == 0.0
    end


    desc "get", "get openmeta tags and rating"
    method_option :format,
      :aliases => "-f",
      :default => nil,
      :type    => :string,
      :desc    => "print as yaml/plist"
    def get(file)

      tags = {
        :tags => Openmeta.get_tags(file),
        :rating => Openmeta.get_rating(file)
      }

      puts_to(options[:format], tags)
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
