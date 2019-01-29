$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'slack-stash/version'

Gem::Specification.new do |s|
  s.name        = 'slack-stash'
  s.version     = SlackStash::VERSION
  s.date        = '2019-01-21'
  s.summary     = 'Slack Stash'
  s.description = 'Stash pull request notificiations for Slack'
  s.authors     = ['Ryan Tulino']
  s.email       = 'rtulino@gmail.com'
  s.files       = []
  s.homepage    = 'http://rubygems.org/gems/slack-stash'
  s.license     = 'MIT'
  s.add_runtime_dependency 'yaml'
end