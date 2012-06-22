# -*- encoding: utf-8 -*-
require File.expand_path('../lib/svg2raphael/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Misty De Meo"]
  gem.email         = ["mistydemeo@gmail.com"]
  gem.description   = %q{Convert SVG shapes to a RaphaelJS-friendly object}
  gem.summary       = %q{Convert SVG shapes to a RaphaelJS-friendly object}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "svg2raphael"
  gem.require_paths = ["lib"]
  gem.version       = Raphael::VERSION

  gem.add_runtime_dependency 'nokogiri'
end
