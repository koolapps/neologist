$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rust/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Rust"
  s.version     = Rust::VERSION
  s.authors     = %w[Christopher\ Keele]
  s.email       = %w[dev@chriskeele.com]
  s.homepage    = "https://www.github.com/rawsugar/rust"
  s.summary     = "Inject static markdown content from gists into your Rails app"
  s.description = "TODO: Description of Rust."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0.beta1"
  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "foundation-rails"
  s.add_dependency "github"
  s.add_dependency "redcarpet"

  s.add_development_dependency "sqlite3"
end
