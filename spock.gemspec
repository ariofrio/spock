# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spock/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andres Riofrio"]
  gem.email         = ["riofrios@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "spock"
  gem.require_paths = ["lib"]
  gem.version       = Spock::VERSION
  
  gem.add_dependency 'trollop', '~> 2.0'
end
