# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{concat_rpc}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2009-01-09}
  s.description = %q{Api for 20Sec Concat - Contact managing}
  s.email = %q{grosser.michael@gmail.com}
  s.extra_rdoc_files = ["lib/concat_rpc/person.rb", "lib/concat_rpc.rb", "README.markdown"]
  s.files = ["Manifest", "nbproject/private/private.xml", "nbproject/private/rake-d.txt", "lib/concat_rpc/person.rb", "lib/concat_rpc.rb", "spec/spec_helper.rb", "spec/concat_rpc_spec.rb", "init.rb", "Rakefile", "README.markdown", "concat_rpc.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/grosser/concat_rpc}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Concat_rpc", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{concat_rpc}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Api for 20Sec Concat - Contact managing}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end
