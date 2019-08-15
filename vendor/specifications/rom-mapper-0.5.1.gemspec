# -*- encoding: utf-8 -*-
# stub: rom-mapper 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rom-mapper".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Solnica".freeze]
  s.date = "2017-05-03"
  s.description = "ROM mapper component".freeze
  s.email = "piotr.solnica@gmail.com".freeze
  s.homepage = "http://rom-rb.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "ROM mapper component".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
      s.add_runtime_dependency(%q<dry-core>.freeze, ["~> 0.2", ">= 0.2.3"])
      s.add_runtime_dependency(%q<transproc>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
    else
      s.add_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
      s.add_dependency(%q<dry-core>.freeze, ["~> 0.2", ">= 0.2.3"])
      s.add_dependency(%q<transproc>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
    s.add_dependency(%q<dry-core>.freeze, ["~> 0.2", ">= 0.2.3"])
    s.add_dependency(%q<transproc>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
  end
end
