# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'devise-onesignal', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'devise-onesignal'
    gem.version               = DeviseOnesignal::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Implement user targeted cross-platform notifications in your Rails app'
    gem.description           = 'Implement user targeted cross-platform notifications with OneSignal & Devise in your Rails app. This gem can also be used without Devise, but it is primarily intended to be used along with some sort of user-management-system.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://github.com/jonhue/devise-onesignal'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'vendor/**/*']
    gem.require_paths         = ['lib']

    gem.post_install_message  = IO.read('INSTALL.md')

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'activesupport', '>= 5.0'
    gem.add_dependency 'activerecord', '>= 5.0'
    gem.add_dependency 'actionview', '>= 5.0'
    gem.add_dependency 'actionpack', '>= 5.0'
    gem.required_ruby_version = '>= 2.3'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
