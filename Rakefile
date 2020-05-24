task :default => :test

desc "Run tests"
task :test => [:spec, :savon_spec]

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  RSpec::Core::RakeTask.new(:savon_spec) do |t|
    puts "--default-path #{File.join(Gem::Specification.find_by_name('savon').gem_dir, 'spec')}"
    t.pattern = Dir.glob(File.join(Gem::Specification.find_by_name('savon').gem_dir, 'spec/**/*_spec.rb'))
  end
rescue LoadError
end
