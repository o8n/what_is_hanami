# -*- encoding: utf-8 -*-
# stub: hanami-model 1.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "hanami-model".freeze
  s.version = "1.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Luca Guidi".freeze]
  s.date = "2019-01-31"
  s.description = "A persistence framework with entities and repositories".freeze
  s.email = ["me@lucaguidi.com".freeze]
  s.homepage = "http://hanamirb.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A persistence layer for Hanami".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hanami-utils>.freeze, ["~> 1.3"])
      s.add_runtime_dependency(%q<rom>.freeze, ["~> 3.3", ">= 3.3.3"])
      s.add_runtime_dependency(%q<rom-sql>.freeze, ["~> 1.3", ">= 1.3.5"])
      s.add_runtime_dependency(%q<rom-repository>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
      s.add_runtime_dependency(%q<dry-logic>.freeze, ["~> 0.4.2", "< 0.5"])
      s.add_runtime_dependency(%q<concurrent-ruby>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.6", "< 3"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    else
      s.add_dependency(%q<hanami-utils>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rom>.freeze, ["~> 3.3", ">= 3.3.3"])
      s.add_dependency(%q<rom-sql>.freeze, ["~> 1.3", ">= 1.3.5"])
      s.add_dependency(%q<rom-repository>.freeze, ["~> 1.4"])
      s.add_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<dry-logic>.freeze, ["~> 0.4.2", "< 0.5"])
      s.add_dependency(%q<concurrent-ruby>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.6", "< 3"])
      s.add_dependency(%q<rake>.freeze, ["~> 12"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<hanami-utils>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rom>.freeze, ["~> 3.3", ">= 3.3.3"])
    s.add_dependency(%q<rom-sql>.freeze, ["~> 1.3", ">= 1.3.5"])
    s.add_dependency(%q<rom-repository>.freeze, ["~> 1.4"])
    s.add_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<dry-logic>.freeze, ["~> 0.4.2", "< 0.5"])
    s.add_dependency(%q<concurrent-ruby>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.6", "< 3"])
    s.add_dependency(%q<rake>.freeze, ["~> 12"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
  end
end
