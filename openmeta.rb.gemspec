# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "openmeta.rb"
  s.version = "2.1.1.20131024194128"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zhao Cai"]
  s.cert_chain = ["/Users/zhaocai/.gem/gem-public_cert.pem"]
  s.date = "2013-10-24"
  s.description = "openMeta in Ruby (support mac system native ruby 1.8, and MacRuby). This gem ports [openmeta]( http://code.google.com/p/openmeta/ ) API to ruby using framework.\n\nIn OSX 10.9, the default support for rubycocoa is dropped. You can use /System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby."
  s.email = ["caizhaoff@gmail.com"]
  s.executables = ["tag"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.md"]
  s.files = [".gemtest", "Gemfile", "Gemfile.lock", "Guardfile", "History.txt", "Manifest.txt", "README.md", "Rakefile", "bin/tag", "lib/openmeta.rb", "lib/openmeta/cli.rb", "lib/openmeta/friendly_errors.rb", "lib/openmeta/macruby.rb", "lib/openmeta/rubycocoa.rb", "lib/openmeta/ui.rb", "lib/openmeta/version.rb", "openmeta.rb.gemspec", "resource/OpenMeta.framework.pkg", "spec/openmeta_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "http://zhaocai.github.com/openmeta.rb"
  s.licenses = ["GPL-3"]
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "openmeta.rb"
  s.rubygems_version = "2.0.3"
  s.signing_key = "/Users/zhaocai/.gem/gem-private_key.pem"
  s.summary = "openMeta in Ruby (support mac system native ruby 1.8, and MacRuby)"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.18.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 0"])
      s.add_development_dependency(%q<hoe-gemspec>, [">= 0"])
      s.add_development_dependency(%q<hoe-git>, [">= 0"])
      s.add_development_dependency(%q<hoe-version>, [">= 0"])
      s.add_development_dependency(%q<hoe-bundler>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<terminal-notifier-guard>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.18.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 0"])
      s.add_dependency(%q<hoe-gemspec>, [">= 0"])
      s.add_dependency(%q<hoe-git>, [">= 0"])
      s.add_dependency(%q<hoe-version>, [">= 0"])
      s.add_dependency(%q<hoe-bundler>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<terminal-notifier-guard>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.18.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 0"])
    s.add_dependency(%q<hoe-gemspec>, [">= 0"])
    s.add_dependency(%q<hoe-git>, [">= 0"])
    s.add_dependency(%q<hoe-version>, [">= 0"])
    s.add_dependency(%q<hoe-bundler>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<terminal-notifier-guard>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
  end
end
