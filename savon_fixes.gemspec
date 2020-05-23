# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'savon_fixes/version'

Gem::Specification.new do |s|
  s.name          = 'savon_fixes'
  s.version       = SavonFixes::VERSION
  s.authors       = ['Lukas Oberhuber']
  s.email         = ['lukas.oberhuber@simplybusiness.co.uk']
  s.homepage      = 'https://github.com/Lukas Oberhuber/savon_fixes'
  s.licenses      = ['MIT']
  s.summary       = '[summary]'
  s.description   = '[description]'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
