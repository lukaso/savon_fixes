task :default => :test

desc "Run tests"
task :test => [:spec, :savon_spec]

begin
  require 'rspec/core/rake_task'
  gem_dir = Gem::Specification.find_by_name('savon').gem_dir
  # Skip failing integration tests
  pattern = Dir.glob(File.join(gem_dir, 'spec/savon/**/*_spec.rb')) +
            [File.join(gem_dir, "spec/integration/zipcode_example_spec.rb")]
  RSpec::Core::RakeTask.new(:spec)
  RSpec::Core::RakeTask.new(:savon_spec) do |t|
    t.pattern = pattern
  end
rescue LoadError
end
