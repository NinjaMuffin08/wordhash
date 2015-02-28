description = "
wordhash: Human-readable representations of digests.

A clone of Zachary Voase's humanhash."

Gem::Specification.new do |gem|
  gem.name        = 'wordhash'
  gem.version     = '0.0.1'
  gem.description = description
  gem.summary     = 'Human-readable representations of digests'
  gem.authors     = ['Louis Pilfold']
  gem.email       = 'louis@lpil.uk'
  gem.homepage    = 'http://github.com/lpil/wordhash'
  gem.license     = 'MIT'

  gem.files       = `git ls-files lib spec *.md LICENCE`.split("\n")
  gem.test_files  = gem.files.grep(/\A(test|spec|features)/)

  gem.add_development_dependency 'rspec', '~>3.1'
  gem.add_development_dependency 'rubocop', '~> 0.28'
  gem.add_development_dependency 'pry', '~> 0.10'
end
