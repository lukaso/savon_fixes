require 'savon_fixes'

$GEM_DIR = Gem::Specification.find_by_name('savon').gem_dir
$LOAD_PATH.unshift File.join($GEM_DIR, 'spec')
$LOAD_PATH.unshift $GEM_DIR

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

#
# ===== Savon `spec/spec_helper.rb` =====
#
require "rspec"

# don't have HTTPI lazy-load HTTPClient, because then
# it can't actually be refered to inside the specs.
require "httpclient"

support_files = File.expand_path("spec/support/**/*.rb", $GEM_DIR)
Dir[support_files].each { |file| require file }

RSpec.configure do |config|
  config.include SpecSupport
  config.mock_with :mocha
  config.order = "random"
end

HTTPI.log = false

# ----- end savon spec_helper.rb -----

support_files = File.expand_path("../support/**/*.rb", __FILE__)
Dir[support_files].each { |file| require file }
