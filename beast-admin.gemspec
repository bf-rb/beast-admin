# coding: utf-8
require File.join(File.dirname(__FILE__), 'lib', 'beast_admin', 'version')

Gem::Specification.new do |spec|
  spec.name          = 'beast-admin'
  spec.version       = BeastAdmin::VERSION
  spec.authors       = ['Alex']
  spec.email         = ['rormercury@gmail.com']

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/rubybeast/beast-admin'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %W(lib app)

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_dependency 'rails', '>= 4.1', '< 5.0'
end
