require 'savon'
require 'savon_fixes'

gem_dir = Gem::Specification.find_by_name('savon').gem_dir
$LOAD_PATH.unshift File.join(gem_dir, 'spec')
$LOAD_PATH.unshift gem_dir

require "bundler"
Bundler.setup(:default, :development)

unless RUBY_PLATFORM =~ /java/
  require "simplecov"
  require "coveralls"

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
      add_filter "spec"
  end
end

RSpec.configure do |config|
  config.before(:all) do
    @gem_dir = gem_dir
  end
end

#
# ===== Savon `spec/spec_helper.rb` =====
#
require "rspec"

# don't have HTTPI lazy-load HTTPClient, because then
# it can't actually be refered to inside the specs.
require "httpclient"

support_files = File.expand_path("spec/support/**/*.rb", gem_dir)
Dir[support_files].each { |file| require file }

RSpec.configure do |config|
  config.include SpecSupport
  config.mock_with :mocha
  config.order = "random"
end

HTTPI.log = false
