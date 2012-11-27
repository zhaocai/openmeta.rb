# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "openmeta"
  s.version = "1.0.0.20121127020226"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhao Cai"]
  s.date = "2012-11-27"
  s.description = "FIX (describe your package)"
  s.email = ["caizhaoff@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/openmeta.rb", "lib/openmeta/cli.rb", "lib/openmeta/friendly_errors.rb", "lib/openmeta/ui.rb", "lib/openmeta/version.rb", "test/test_openmeta.rb", ".gemtest"]
  s.homepage = "https://github.com/zhaocai/openmeta.rb"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "openmeta"
  s.rubygems_version = "1.8.24"
  s.summary = "FIX (describe your package)"
  s.test_files = ["test/test_openmeta.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0.16.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.3"])
    else
      s.add_dependency(%q<thor>, [">= 0.16.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.3"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0.16.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.3"])
  end
end
