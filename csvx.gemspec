$:.push File.expand_path("../lib", __FILE__)

require 'csvx'

Gem::Specification.new do |s|
  s.name = 'csvx'
  s.version = CSVX::VERSION
  s.homepage = 'https://github.com/rodjek/csvx/'
  s.summary = 'Enterprise-ready CSV'
  s.description = "You're still reading this?"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'

  s.authors = ['Tim Sharpe']
  s.email = 'tim@sharpe.id.au'
end
