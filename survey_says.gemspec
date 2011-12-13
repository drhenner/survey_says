$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "survey_says/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "survey_says"
  s.version     = SurveySays::VERSION
  s.authors     = ["David Henner"]
  s.email       = ["drhenner@gmail.com"]
  s.homepage    = "http://www.ror-e.com"
  s.summary     = "This is a plugin that allows you to create a questionaire with custom scores."
  s.description = "This is a plugin that allows you to create a questionaire with custom scores."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"
  s.add_dependency "jquery-rails"
  s.add_dependency 'twitter-bootstrap-rails'
  s.add_dependency "paperclip", "~> 2.4"

  s.add_development_dependency "nifty-generators"
  s.add_development_dependency 'ruby-debug19'
  s.add_development_dependency "sqlite3"
end
