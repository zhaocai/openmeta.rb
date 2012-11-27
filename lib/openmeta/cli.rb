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

    desc "recent tags", "print recent tags"
    method_option :format,
      :aliases => "-f",
      :default => nil,
      :type    => :string,
      :desc    => "print as yaml/xml"
    def recent
      tags = OpenMetaPrefs.recentTags
      unless options[:format]
        puts tags
      else
        require 'yaml' if options[:format] == 'yaml'
        to_method = "to_#{options[:format]}"

        begin
          puts tags.send(to_method)
        rescue NoMethodError
          raise Openmeta::NoMethodError, "#{to_method} has not implemented!"
        end
      end
    end

    desc "clone", "clone openmeta tags and rating"
    method_option :from,
      :aliases  => "-f",
      :required => true,
      :type     => :string,
      :desc     => "clone openmeta tags and rating from the FILE [required]"
    def clone(file)
      from_file = File.expand_path(options[:from])
      unless File.exist?(from_file)
          raise Openmeta::PathError, "#{from_file} does not exist!"
      end

      tags = Openmeta.get_tags(from_file)
      rating = Openmeta.get_rating(from_file)

      Openmeta.set_tags(tags, file) unless tags.empty?
      Openmeta.set_rating(rating, file) unless rating == 0.0
    end
  end
end
