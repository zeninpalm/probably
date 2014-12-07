require "bundler"
Bundler.setup

require "rake"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "probably/version"

task :gem => :build
task :build do
  system "gem build probably.gemspec"
end

task :install => :build do
  system "sudo gem install Probably-#{Probably::VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{Probably::VERSION} -m 'Tagging #{Probably::VERSION}'"
  system "git push --tags"
  system "gem push Probably-#{Probably::VERSION}.gem"
  system "rm Probably-#{Probably::VERSION}.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec

