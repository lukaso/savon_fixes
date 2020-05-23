# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'savon_fixes/version'

Gem::Specification.new do |s|
  s.name          = 'savon_fixes'
  s.version       = SavonFixes::VERSION
  s.authors       = ['Lukas Oberhuber']
  s.email         = ['lukaso@gmail.com']
  s.homepage      = 'https://github.com/lukaso/savon_fixes'
  s.licenses      = ['MIT']
  s.summary       = 'Patches the Savon gem so fixes are included'
  s.description   = 'Patches the Savon gem so fixes are included'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'pry', '~> 0'
end
