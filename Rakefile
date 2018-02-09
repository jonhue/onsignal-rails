require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

system 'bundle'
system "gem build onsignal.gemspec"


RSpec::Core::RakeTask.new

task default: :spec
