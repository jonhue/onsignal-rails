# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'on_signal', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'onsignal'
    gem.version               = OnSignal::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'OneSignal API wrapper simplifying user targeted cross platform notifications'
    gem.description           = 'OneSignal API wrapper simplifying user targeted cross platform notifications.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/onsignal'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*']
    gem.require_paths         = ['lib']

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'activerecord', '>= 5.0'
    gem.add_dependency 'actionview', '>= 5.0'
    gem.add_dependency 'actionpack', '>= 5.0'
    gem.required_ruby_version = '>= 2.3'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
