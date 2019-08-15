# -*- encoding: utf-8 -*-
# stub: rom-sql 1.3.5 ruby lib

Gem::Specification.new do |s|
  s.name = "rom-sql".freeze
  s.version = "1.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Piotr Solnica".freeze]
  s.date = "2017-10-12"
  s.description = "SQL databases support for ROM".freeze
  s.email = ["piotr.solnica@gmail.com".freeze]
  s.homepage = "http://rom-rb.org".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "SQL databases support for ROM".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sequel>.freeze, ["~> 4.43"])
      s.add_runtime_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
      s.add_runtime_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
      s.add_runtime_dependency(%q<dry-core>.freeze, ["~> 0.3"])
      s.add_runtime_dependency(%q<rom>.freeze, ["~> 3.2", ">= 3.2.2"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
    else
      s.add_dependency(%q<sequel>.freeze, ["~> 4.43"])
      s.add_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
      s.add_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
      s.add_dependency(%q<dry-core>.freeze, ["~> 0.3"])
      s.add_dependency(%q<rom>.freeze, ["~> 3.2", ">= 3.2.2"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<sequel>.freeze, ["~> 4.43"])
    s.add_dependency(%q<dry-equalizer>.freeze, ["~> 0.2"])
    s.add_dependency(%q<dry-types>.freeze, ["~> 0.11.0"])
    s.add_dependency(%q<dry-core>.freeze, ["~> 0.3"])
    s.add_dependency(%q<rom>.freeze, ["~> 3.2", ">= 3.2.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
  end
end
