# -*- encoding: utf-8 -*-
# stub: rom-repository 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rom-repository".freeze
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Solnica".freeze]
  s.date = "2017-07-04"
  s.description = "rom-repository adds support for auto-mapping and commands on top of rom-rb relations".freeze
  s.email = "piotr.solnica+oss@gmail.com".freeze
  s.homepage = "http://rom-rb.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Repository abstraction for rom-rb".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rom>.freeze, ["~> 3.3"])
      s.add_runtime_dependency(%q<rom-mapper>.freeze, ["~> 0.5"])
      s.add_runtime_dependency(%q<dry-core>.freeze, ["~> 0.3", ">= 0.3.1"])
      s.add_runtime_dependency(%q<dry-struct>.freeze, ["~> 0.3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 11.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
    else
      s.add_dependency(%q<rom>.freeze, ["~> 3.3"])
      s.add_dependency(%q<rom-mapper>.freeze, ["~> 0.5"])
      s.add_dependency(%q<dry-core>.freeze, ["~> 0.3", ">= 0.3.1"])
      s.add_dependency(%q<dry-struct>.freeze, ["~> 0.3"])
      s.add_dependency(%q<rake>.freeze, ["~> 11.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<rom>.freeze, ["~> 3.3"])
    s.add_dependency(%q<rom-mapper>.freeze, ["~> 0.5"])
    s.add_dependency(%q<dry-core>.freeze, ["~> 0.3", ">= 0.3.1"])
    s.add_dependency(%q<dry-struct>.freeze, ["~> 0.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
  end
end
