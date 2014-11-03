# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/office365/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-office365"
  spec.version       = Omniauth::Office365::VERSION
  spec.authors       = ["Josef Šimánek"]
  spec.email         = ["josef.simanek@gmail.com"]
  spec.summary       = %q{omniauth provider for Office365}
  spec.description   = %q{omniauth provider for new Office365 API}
  spec.homepage      = "https://github.com/simi/omniauth-office365"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "omniauth-oauth2"

  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mocha"
end
