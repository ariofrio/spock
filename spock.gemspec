# -*- encoding: utf-8 -*-
if RUBY_VERSION == '1.8.7'
  $:.unshift File.expand_path("../lib", __FILE__)
  require "spock/version"
else
  require File.expand_path('../lib/spock/version', __FILE__ )
end

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
