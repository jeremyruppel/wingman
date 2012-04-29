# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wingman/version"

Gem::Specification.new do |s|
  s.name        = "wingman"
  s.version     = Wingman::VERSION
  s.authors     = ["Jeremy Ruppel"]
  s.email       = ["jeremy.ruppel@gmail.com"]
  s.homepage    = "https://github.com/jeremyruppel/wingman"
  s.summary     = %q{DO NOT USE YET}
  s.description = %q{DO NOT USE YET}

  s.rubyforge_project = "wingman"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_dependency 'rails', '>= 3.2.0'
  s.add_dependency 'haml', '>= 3.1.4'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'appraisal', '0.4.1'
  s.add_development_dependency 'rspec-rails', '2.8.1'
  s.add_development_dependency 'shoulda'
end
