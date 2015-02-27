description = "
humanhash.rb: Human-readable representations of digests.

A clone of Zachary Voase's humanhash."

Gem::Specification.new do |gem|
  gem.name        = 'humanhash.rb'
  gem.version     = '0.0.1'
  gem.description = description
  gem.summary     = 'Human-readable representations of digests'
  gem.authors     = ['Louis Pilfold']
  gem.email       = 'louis@lpil.uk'
  gem.homepage    = 'http://github.com/lpil/humanhash.rb'
  gem.license     = 'MPL v2'

  gem.files       = `git ls-files lib spec *.md LICENCE`.split("\n")
  gem.test_files  = gem.files.grep(/\A(test|spec|features)/)

  gem.add_development_dependency 'rspec', '~>3.1'
  gem.add_development_dependency 'rubocop', '~> 0.28'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_development_dependency 'flog'
  gem.add_development_dependency 'flay'
  gem.add_development_dependency 'reek'
end
